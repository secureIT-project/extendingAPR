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

BREAKLINE=34
INTERESTING_VARIABLES=( pkt res )
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

    # Negative test cases:
    n73) INPUT="0 -1526" && OUTPUT="res=0,pkt=10,";;
    n72) INPUT="31473 -26859" && OUTPUT="pkt=31473,";;
    n71) INPUT="14360 -11017" && OUTPUT="pkt=14360,";;
    n70) INPUT="0 32018" && OUTPUT="res=0,pkt=10,";;
    n69) INPUT="-9462 24996" && OUTPUT="";;
    n68) INPUT="-30119 10058" && OUTPUT="";;
    n67) INPUT="-32262 0" && OUTPUT="";;
    n66) INPUT="-15399 22212" && OUTPUT="";;
    n65) INPUT="15143 0" && OUTPUT="pkt=15143,";;
    n64) INPUT="31835 0" && OUTPUT="pkt=31835,";;
    n63) INPUT="-27735 2825" && OUTPUT="";;
    n62) INPUT="0 -22529" && OUTPUT="res=0,pkt=10,";;
    n61) INPUT="-26597 0" && OUTPUT="";;
    n60) INPUT="-19180 -8698" && OUTPUT="";;
    n59) INPUT="0 -367" && OUTPUT="res=0,pkt=10,";;
    n58) INPUT="-16663 0" && OUTPUT="";;
    n57) INPUT="12121 16076" && OUTPUT="pkt=12121,";;
    n56) INPUT="0 7789" && OUTPUT="res=0,pkt=10,";;
    n55) INPUT="15106 30709" && OUTPUT="pkt=15106,";;
    n54) INPUT="0 -31699" && OUTPUT="res=0,pkt=10,";;
    n53) INPUT="0 -21205" && OUTPUT="res=0,pkt=10,";;
    n52) INPUT="22220 -9538" && OUTPUT="pkt=22220,";;
    n51) INPUT="8741 -4733" && OUTPUT="pkt=8741,";;
    n50) INPUT="4389 -18627" && OUTPUT="pkt=4389,";;
    n49) INPUT="0 10398" && OUTPUT="res=0,pkt=10,";;
    n48) INPUT="0 29564" && OUTPUT="res=0,pkt=10,";;
    n47) INPUT="0 32147" && OUTPUT="res=0,pkt=10,";;
    n46) INPUT="12470 -18384" && OUTPUT="pkt=12470,";;
    n45) INPUT="-25968 0" && OUTPUT="";;
    n44) INPUT="0 28773" && OUTPUT="res=0,pkt=10,";;
    n43) INPUT="-26084 0" && OUTPUT="";;
    n42) INPUT="20069 0" && OUTPUT="pkt=20069,";;
    n41) INPUT="-13964 -15010" && OUTPUT="";;
    n40) INPUT="0 -29861" && OUTPUT="res=0,pkt=10,";;
    n39) INPUT="1558 -30425" && OUTPUT="pkt=1558,";;
    n38) INPUT="-18965 -17520" && OUTPUT="";;
    n37) INPUT="17142 -9678" && OUTPUT="pkt=17142,";;
    n36) INPUT="-13470 32158" && OUTPUT="";;
    n35) INPUT="0 14709" && OUTPUT="res=0,pkt=10,";;
    n34) INPUT="8985 0" && OUTPUT="pkt=8985,";;
    n33) INPUT="18385 30798" && OUTPUT="pkt=18385,";;
    n32) INPUT="0 -1044" && OUTPUT="res=0,pkt=10,";;
    n31) INPUT="24173 25449" && OUTPUT="pkt=24173,";;
    n30) INPUT="20811 -10744" && OUTPUT="pkt=20811,";;
    n29) INPUT="0 1182" && OUTPUT="res=0,pkt=10,";;
    n28) INPUT="12813 16009" && OUTPUT="pkt=12813,";;
    n27) INPUT="11407 -17637" && OUTPUT="pkt=11407,";;
    n26) INPUT="27551 0" && OUTPUT="pkt=27551,";;
    n25) INPUT="0 -13859" && OUTPUT="res=0,pkt=10,";;
    n24) INPUT="27357 22698" && OUTPUT="pkt=27357,";;
    n23) INPUT="-29918 -21678" && OUTPUT="";;
    n22) INPUT="-10611 24236" && OUTPUT="";;
    n21) INPUT="7044 19138" && OUTPUT="pkt=7044,";;
    n20) INPUT="-27892 -16689" && OUTPUT="";;
    n19) INPUT="8239 0" && OUTPUT="pkt=8239,";;
    n18) INPUT="29023 0" && OUTPUT="pkt=29023,";;
    n17) INPUT="-31263 10392" && OUTPUT="";;
    n16) INPUT="17335 0" && OUTPUT="pkt=17335,";;
    n15) INPUT="0 -25571" && OUTPUT="res=0,pkt=10,";;
    n14) INPUT="10718 17819" && OUTPUT="pkt=10718,";;
    n13) INPUT="26749 9204" && OUTPUT="pkt=26749,";;
    n12) INPUT="-24599 0" && OUTPUT="";;
    n11) INPUT="0 -4626" && OUTPUT="res=0,pkt=10,";;
    n10) INPUT="18300 -8421" && OUTPUT="pkt=18300,";;
    n9) INPUT="10968 0" && OUTPUT="pkt=10968,";;
    n8) INPUT="26163 11180" && OUTPUT="pkt=26163,";;
    n7) INPUT="0 -438" && OUTPUT="res=0,pkt=10,";;
    n6) INPUT="-25288 0" && OUTPUT="";;
    n5) INPUT="0 -22914" && OUTPUT="res=0,pkt=10,";;
    n4) INPUT="26690 27124" && OUTPUT="pkt=26690,";;
    n3) INPUT="-482 15117" && OUTPUT="res=0,pkt=10,";;
    n2) INPUT="0 0" && OUTPUT="res=0,pkt=10,";;
    n1) INPUT="" && OUTPUT="";;

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
