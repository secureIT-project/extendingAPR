#!/bin/bash
# $1 = EXE 
# $2 = test name  
# $3 = port 
# $4 = source name
# $5 = single-fitness-file name 
# exit 0 = success

ulimit -t 1

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# echo "$1" "$2" "$3" "$4" "$5" >> testruns.txt
. "/opt/Repair/Repair/compilation/template.sh"

BREAKLINE=35
INTERESTING_VARIABLES=( i j num )
INPUT=""                        # Set by test case
OUTPUT=""                       # Set by test case
ACTUAL_OUTPUT=""
EXIT=255


log()
{
    {
    printf "Input arguments: %s\n" "$*"
    printf "\tBreakline: %d\n" "$BREAKLINE"
    printf "\tVariables: %s\n" "${INTERESTING_VARIABLES[*]}"

    printf "\tInput: %s\n" "${INPUT[*]}"
    printf "\tExpected output: %s\n" "$OUTPUT"
    printf "\tActual output: %s\n" "$ACTUAL_OUTPUT"
    printf "\tExit code: %d\n" "$EXIT"
    } >> testruns.txt
}

debugger_output()
{
    # $1 - EXE
    # shift;
    # $@ - Arguments
    local exe="$1"; shift
    local args="$@"

    debugger_vars="$(gdb -ex "b $BREAKLINE" -ex "run ${args[*]}" -ex 'info locals' -ex cont -ex quit "$exe" --batch | grep -E '^.*\s=\s.*$')"
    exit_code=$?
    [ $exit_code != 0 ] && return $exit_code

    local output=""

    while IFS=' = ' read -r var val; do
        for nondet_var in "${INTERESTING_VARIABLES[@]}"; do
            if [ "$nondet_var" = "$var" ]; then
                [[ "$val" = *"<optimized out>"* ]] && continue;
                local output="$output$var=$val,"
            fi;
        done
    done <<< "$debugger_vars"

    printf "%s" "$output"
}

case $2 in
    # Positive test cases:
    p8) INPUT="-24599" && OUTPUT="i=0,num=-24599,";;
    p7) INPUT="-4626" && OUTPUT="i=0,num=-4626,";;
    p6) INPUT="-8421" && OUTPUT="i=0,num=-8421,";;
    p5) INPUT="-438" && OUTPUT="i=0,num=-438,";;
    p4) INPUT="-25288" && OUTPUT="i=0,num=-25288,";;
    p3) INPUT="-22914" && OUTPUT="i=0,num=-22914,";;
    p2) INPUT="-482" && OUTPUT="i=0,num=-482,";;
    p1) INPUT="0" && OUTPUT="i=0,num=0,";;

    # Negative test cases:
    n11) INPUT="10718" && OUTPUT="i=10718,num=10718,";;
    n10) INPUT="9204" && OUTPUT="i=9204,num=9204,";;
    n9) INPUT="26749" && OUTPUT="i=26749,num=26749,";;
    n8) INPUT="18300" && OUTPUT="i=18300,num=18300,";;
    n7) INPUT="10968" && OUTPUT="i=10968,num=10968,";;
    n6) INPUT="11180" && OUTPUT="i=11180,num=11180,";;
    n5) INPUT="26163" && OUTPUT="i=26163,num=26163,";;
    n4) INPUT="27124" && OUTPUT="i=27124,num=27124,";;
    n3) INPUT="26690" && OUTPUT="i=26690,num=26690,";;
    n2) INPUT="15117" && OUTPUT="i=15117,num=15117,";;
    n1) INPUT="5" && OUTPUT="";;

esac

if [[ "$4" == *"coverage"* ]]; then
    "$1" $INPUT

    [[ $2 == *"n"* ]] && EXIT=1
    [[ $2 == *"p"* ]] && EXIT=0

    log "$@"
else
    # Parse c code for breakline update
    if [ -d "/opt/Repair/" ]; then
        {
            source_code="$4"

            # If invalid source code file. Do some guessing.
            # Seems like this is a bug in genprog.
            if [ ! -f "$4" ]; then 
                source_code="$(dirname "$4")/code.c"
            fi

            temp_file="$(mktemp /tmp/APR-XXXXXXXXXXXXX.c)"
            printf "%b" "$(apply_template "$source_code")" >> "$temp_file"
            BREAKLINE="$(python3 /opt/Repair/Repair/test_cases/get_breakline.py "$temp_file")"
        } >> python_stuff.txt
    fi

    ACTUAL_OUTPUT="$(debugger_output "$1" $INPUT)"
    EXIT=$?
    if [ $EXIT = 0 ]; then
        if [ "$ACTUAL_OUTPUT" != "$OUTPUT" ] && [ -n "$OUTPUT" ]; then
            EXIT=1;
        fi
    fi
    log "$@"
fi

exit $EXIT
