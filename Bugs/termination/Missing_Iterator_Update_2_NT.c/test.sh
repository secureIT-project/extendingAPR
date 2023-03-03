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

BREAKLINE=46
INTERESTING_VARIABLES=( rc dval_mv_size flag )
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
    p20) INPUT="-9462 24996" && OUTPUT="rc=1,dval_mv_size=24996,";;
    p19) INPUT="-30119 10058" && OUTPUT="rc=1,dval_mv_size=10058,";;
    p18) INPUT="-32262 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p17) INPUT="-15399 22212" && OUTPUT="rc=1,dval_mv_size=22212,";;
    p16) INPUT="-27735 2825" && OUTPUT="rc=1,dval_mv_size=2825,";;
    p15) INPUT="-26597 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p14) INPUT="-19180 -8698" && OUTPUT="rc=1,dval_mv_size=-8698,";;
    p13) INPUT="-16663 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p12) INPUT="-25968 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p11) INPUT="-26084 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p10) INPUT="-13964 -15010" && OUTPUT="rc=1,dval_mv_size=-15010,";;
    p9) INPUT="-18965 -17520" && OUTPUT="rc=1,dval_mv_size=-17520,";;
    p8) INPUT="-13470 32158" && OUTPUT="rc=1,dval_mv_size=32158,";;
    p7) INPUT="-29918 -21678" && OUTPUT="rc=1,dval_mv_size=-21678,";;
    p6) INPUT="-10611 24236" && OUTPUT="rc=1,dval_mv_size=24236,";;
    p5) INPUT="-27892 -16689" && OUTPUT="rc=1,dval_mv_size=-16689,";;
    p4) INPUT="-31263 10392" && OUTPUT="rc=1,dval_mv_size=10392,";;
    p3) INPUT="-24599 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p2) INPUT="-25288 0" && OUTPUT="rc=1,dval_mv_size=0,";;
    p1) INPUT="-482 15117" && OUTPUT="rc=1,dval_mv_size=15117,";;

    # Negative test cases:
    n53) INPUT="0 -1526" && OUTPUT="";;
    n52) INPUT="31473 -26859" && OUTPUT="";;
    n51) INPUT="14360 -11017" && OUTPUT="";;
    n50) INPUT="0 32018" && OUTPUT="";;
    n49) INPUT="15143 0" && OUTPUT="";;
    n48) INPUT="31835 0" && OUTPUT="";;
    n47) INPUT="0 -22529" && OUTPUT="";;
    n46) INPUT="0 -367" && OUTPUT="";;
    n45) INPUT="12121 16076" && OUTPUT="";;
    n44) INPUT="0 7789" && OUTPUT="";;
    n43) INPUT="15106 30709" && OUTPUT="";;
    n42) INPUT="0 -31699" && OUTPUT="";;
    n41) INPUT="0 -21205" && OUTPUT="";;
    n40) INPUT="22220 -9538" && OUTPUT="";;
    n39) INPUT="8741 -4733" && OUTPUT="";;
    n38) INPUT="4389 -18627" && OUTPUT="";;
    n37) INPUT="0 10398" && OUTPUT="";;
    n36) INPUT="0 29564" && OUTPUT="";;
    n35) INPUT="0 32147" && OUTPUT="";;
    n34) INPUT="12470 -18384" && OUTPUT="";;
    n33) INPUT="0 28773" && OUTPUT="";;
    n32) INPUT="20069 0" && OUTPUT="";;
    n31) INPUT="0 -29861" && OUTPUT="";;
    n30) INPUT="1558 -30425" && OUTPUT="";;
    n29) INPUT="17142 -9678" && OUTPUT="";;
    n28) INPUT="0 14709" && OUTPUT="";;
    n27) INPUT="8985 0" && OUTPUT="";;
    n26) INPUT="18385 30798" && OUTPUT="";;
    n25) INPUT="0 -1044" && OUTPUT="";;
    n24) INPUT="24173 25449" && OUTPUT="";;
    n23) INPUT="20811 -10744" && OUTPUT="";;
    n22) INPUT="0 1182" && OUTPUT="";;
    n21) INPUT="12813 16009" && OUTPUT="";;
    n20) INPUT="11407 -17637" && OUTPUT="";;
    n19) INPUT="27551 0" && OUTPUT="";;
    n18) INPUT="0 -13859" && OUTPUT="";;
    n17) INPUT="27357 22698" && OUTPUT="";;
    n16) INPUT="7044 19138" && OUTPUT="";;
    n15) INPUT="8239 0" && OUTPUT="";;
    n14) INPUT="29023 0" && OUTPUT="";;
    n13) INPUT="17335 0" && OUTPUT="";;
    n12) INPUT="0 -25571" && OUTPUT="";;
    n11) INPUT="10718 17819" && OUTPUT="";;
    n10) INPUT="26749 9204" && OUTPUT="";;
    n9) INPUT="0 -4626" && OUTPUT="";;
    n8) INPUT="18300 -8421" && OUTPUT="";;
    n7) INPUT="10968 0" && OUTPUT="";;
    n6) INPUT="26163 11180" && OUTPUT="";;
    n5) INPUT="0 -438" && OUTPUT="";;
    n4) INPUT="0 -22914" && OUTPUT="";;
    n3) INPUT="26690 27124" && OUTPUT="";;
    n2) INPUT="0 0" && OUTPUT="";;
    n1) INPUT=" " && OUTPUT="";;

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
