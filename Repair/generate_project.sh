#!/bin/bash
#
# This script is used to generate and configure a termination bug for GenProg
#


# -------------------- Environment & Arguments
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. "$SCRIPT_DIR/utils.sh"
. "$SCRIPT_DIR/test_cases/append_tests.sh"

USAGE="Usage: ${BASH_SOURCE[0]}\n\t<Path to buggy root directory>\n\t<Path to patched source code>\n\t\n\t-v, --variables <variables to use in test-cases to check for behavior, separated by ','>\n\t\tThis option currently only supports variables in the function scope. If not set, this script will parse the buggy source code and attempt to determine the variables, however this approach has flaws and should be avoided."

RANDOM=101

BUGGY_PROJECT=""
FIXED_SRC_FILE=""

VARIABLES=()

while [[ $# -gt 0 ]]; do
    OPTION=$1;
    case $OPTION in
        (-v|--variables)
            shift;
            while read variable; do
                VARIABLES+=( "$variable" )
            done <<< "$(tr "," "\n" <<< "$1")"
            shift;;
        (-h|--help)
            shift;
            printf "%b\n" "$USAGE";
            exit 0;;
        (*)
            [ -z "$BUGGY_PROJECT" ] && BUGGY_PROJECT="$1" && shift && continue;
            [ -z "$FIXED_SRC_FILE" ] && FIXED_SRC_FILE="$1" && shift && continue;;
    esac
done

BUGGY_SRC_FILE="$BUGGY_PROJECT/src/code.c"
TEST_FILE="$BUGGY_PROJECT/test.sh"
TP_OUTPUT_FILE="$BUGGY_PROJECT/output.txt"
CONFIGURATION_FILE="$BUGGY_PROJECT/configuration"

[ -f "$BUGGY_SRC_FILE" ] || die "Cannot find the buggy source code in $BUGGY_SRC_FILE"
[ -f "$FIXED_SRC_FILE" ] || die "Invalid second argument. Cannot find the patched source code."
[ ! -f "$TEST_FILE" ] || die "Test file already exists!"
[ ! -f "$CONFIGURATION_FILE" ] || die "Configuration file already exists!"

TP_OUTPUT_FILE="$(realpath "$TP_OUTPUT_FILE")"
BUGGY_SRC_FILE="$(realpath "$BUGGY_SRC_FILE")"
FIXED_SRC_FILE="$(realpath "$FIXED_SRC_FILE")"
TEST_FILE="$(realpath "$TEST_FILE")"
CONFIGURATION_FILE="$(realpath "$CONFIGURATION_FILE")"

# -------------------- Functions
function watch_variable(){
    local variable_name="$1"
    local exe="$2"
    shift; shift;
    local args=$@

    [ "$(timeout 10s gdb -ex 'b loop' -ex "run ${args[*]}" -ex "watch $variable_name" -ex 'fin' "$exe" --batch | grep -c "^Hardware watchpoint.*$variable_name$")" -gt 1 ]
}

function list_variables(){
    local breakline=$1
    local exe="$2"
    shift; shift;
    local args=$@

    gdb -ex "b $breakline" -ex "run ${args[*]}" -ex 'info locals' -ex quit "$exe" --batch \
        | grep -E '^.*\s=\s.*$'
}

# -------------------- Copy template files
# Copy configuration and test template files to project directory.
cp templates/* "$BUGGY_PROJECT"


# -------------------- Compile
# Compile fixed code
"$SCRIPT_DIR/compilation/compile.sh" "$BUGGY_PROJECT/broken" "$BUGGY_SRC_FILE" \
    || die 'Could not compile non-terminating version.'

# Compile non-terminating
"$SCRIPT_DIR/compilation/compile.sh" "$BUGGY_PROJECT/fixed" "$FIXED_SRC_FILE" \
    || die 'Could not compile terminating version.'

exe_broken="$(realpath "$BUGGY_PROJECT/broken")"
exe_fixed="$(realpath "$BUGGY_PROJECT/fixed")"


# -------------------- Test cases
nargs="$(grep -c '__VERIFIER_nondet_int()' "$BUGGY_SRC_FILE")"

if [ ${#VARIABLES[@]} -eq 0 ]; then
    while IFS= read -r arg; do
        VARIABLES+=( "$arg" )
    done <<< "$(grep -E '=\s*__VERIFIER_nondet_int()' "$BUGGY_SRC_FILE" \
                     | sed 's/int//g;s/\s*=\s*__VERIFIER.*$//g;s/\s//g')"
fi

breakline_broken="$(wc -l < "$BUGGY_SRC_FILE")"
breakline_broken=$((breakline_broken+13))
breakline_fixed="$(wc -l < "$FIXED_SRC_FILE")"
breakline_fixed=$((breakline_fixed+13))

sed -i "s/^BREAKLINE.*$/BREAKLINE=$breakline_broken/" "$TEST_FILE"
sed -i "s/^INTERESTING\_VARIABLES.*$/INTERESTING\_VARIABLES=\( ${VARIABLES[*]} \)/" "$TEST_FILE"


# -------------------- Counter Example
args="$(extract_val_from_counter_example "$TP_OUTPUT_FILE" "$BUGGY_SRC_FILE")" \
              || info "Counter example does not have any values."

if [ ! ${#args[@]} -eq 0 ]; then
    # Debug fixed version and print variables on exit
    debugger_vars="$(list_variables $breakline_fixed "$exe_fixed" ${args[@]})"

    test_case "$exe_broken" "${args[@]}" &
    wait "$!"; exit_code="$?"

    if [ $exit_code != 0 ]; then
        # TODO: Should probably be without output
        # TODO: Or add output
        append_negative_test_case_with_output "$TEST_FILE" "" "${args[@]}"
    else
        info "Extracted non-terminating output from TP is actually terminating..."
    fi
fi

# -------------------- Add test-cases randomly
for ((i=1;i<=nargs*nargs*18;i++)); do
    args=()

    # 33% any positive number, 33% any negative number, 33% 0
    # Random arguments
    for ((j=1;j<=nargs;j++))
    do
        args+=( $((RANDOM * (RANDOM % 3 - 1))) )
    done

    # If test case already exists continue
    grep -q "INPUT=\"${args[*]}\"" "$TEST_FILE" && i=$((i-1)) && continue

    debugger_vars="$(list_variables $breakline_fixed "$exe_fixed" ${args[@]})"
    expected_output=""

    while IFS=' = ' read -r var val; do
        for nondet_var in "${VARIABLES[@]}"; do
            watch_variable "$var" "$exe_fixed" "${args[@]}" \
                && [ "$nondet_var" = "$var" ] && expected_output+="$var=$val,"
        done
    done <<< "$debugger_vars"

    test_case "$exe_broken" "${args[@]}" 2>&1 &
    wait "$!"; exit_code="$?"

    info "Expected output: $expected_output"

    if [ $exit_code = 0 ]; then
        debugger_vars="$(list_variables $breakline_broken "$exe_broken" ${args[@]})"
        actual_output=""

        while IFS=' = ' read -r var val; do
            for nondet_var in "${VARIABLES[@]}"; do
                watch_variable "$var" "$exe_broken" "${args[@]}" \
                    && [ "$nondet_var" = "$var" ] && actual_output+="$var=$val,"
            done
        done <<< "$debugger_vars"

        if [ "$actual_output" = "$expected_output" ]; then
            append_positive_test_case_with_output "$TEST_FILE" "$actual_output" "${args[@]}"
            info "Actual output: $actual_output"
        elif [ "$actual_output" != "$expected_output" ]; then
            append_negative_test_case_with_output "$TEST_FILE" "$expected_output" "${args[@]}"
            info "Actual output: $actual_output"
        fi
        info "Variables: ${VARIABLES[*]}"

    elif [ $exit_code != 0 ]; then
        append_negative_test_case_with_output "$TEST_FILE" "$expected_output" "${args[@]}"
    fi

    echo ""
done

neg_tests="$(grep -E '\s*n[0-9]+\)' "$TEST_FILE" | head -n 1 | grep -oP '(?<=n).*?(?=\))')"
[ -z "$neg_tests" ] && die 'No negative test cases'
pos_tests="$(grep -E '\s*p[0-9]+\)' "$TEST_FILE" | head -n 1 | grep -oP '(?<=p).*?(?=\))' | head -n 1)"

info "Positive test cases: $pos_tests"
info "Negative test cases: $neg_tests"


# -------------------- Update configuration with number of tests
if [ -n "$pos_tests" ]; then
    echo "--pos-tests $pos_tests" >> "$CONFIGURATION_FILE"
else
    echo "--pos-tests 0" >> "$CONFIGURATION_FILE"
fi

[ -n "$neg_tests" ] && echo "--neg-tests $neg_tests" >> "$CONFIGURATION_FILE"


# -------------------- Cleanup
rm "$exe_fixed"
rm "$exe_broken"
