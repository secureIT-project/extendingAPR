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

BREAKLINE=49
INTERESTING_VARIABLES=( errno ret )
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
    n72) INPUT="0 -1526" && OUTPUT="ret=-1526,";;
    n71) INPUT="31473 -26859" && OUTPUT="ret=31473,";;
    n70) INPUT="14360 -11017" && OUTPUT="ret=14360,";;
    n69) INPUT="0 32018" && OUTPUT="ret=32018,";;
    n68) INPUT="-9462 24996" && OUTPUT="ret=-9462,";;
    n67) INPUT="-30119 10058" && OUTPUT="ret=-30119,";;
    n66) INPUT="-32262 0" && OUTPUT="ret=-32262,";;
    n65) INPUT="-15399 22212" && OUTPUT="ret=-15399,";;
    n64) INPUT="15143 0" && OUTPUT="ret=15143,";;
    n63) INPUT="31835 0" && OUTPUT="ret=31835,";;
    n62) INPUT="-27735 2825" && OUTPUT="ret=-27735,";;
    n61) INPUT="0 -22529" && OUTPUT="ret=-22529,";;
    n60) INPUT="-26597 0" && OUTPUT="ret=-26597,";;
    n59) INPUT="-19180 -8698" && OUTPUT="ret=-19180,";;
    n58) INPUT="0 -367" && OUTPUT="ret=-367,";;
    n57) INPUT="-16663 0" && OUTPUT="ret=-16663,";;
    n56) INPUT="12121 16076" && OUTPUT="ret=12121,";;
    n55) INPUT="0 7789" && OUTPUT="ret=7789,";;
    n54) INPUT="15106 30709" && OUTPUT="ret=15106,";;
    n53) INPUT="0 -31699" && OUTPUT="ret=-31699,";;
    n52) INPUT="0 -21205" && OUTPUT="ret=-21205,";;
    n51) INPUT="22220 -9538" && OUTPUT="ret=22220,";;
    n50) INPUT="8741 -4733" && OUTPUT="ret=8741,";;
    n49) INPUT="4389 -18627" && OUTPUT="ret=4389,";;
    n48) INPUT="0 10398" && OUTPUT="ret=10398,";;
    n47) INPUT="0 29564" && OUTPUT="ret=29564,";;
    n46) INPUT="0 32147" && OUTPUT="ret=32147,";;
    n45) INPUT="12470 -18384" && OUTPUT="ret=12470,";;
    n44) INPUT="-25968 0" && OUTPUT="ret=-25968,";;
    n43) INPUT="0 28773" && OUTPUT="ret=28773,";;
    n42) INPUT="-26084 0" && OUTPUT="ret=-26084,";;
    n41) INPUT="20069 0" && OUTPUT="ret=20069,";;
    n40) INPUT="-13964 -15010" && OUTPUT="ret=-13964,";;
    n39) INPUT="0 -29861" && OUTPUT="ret=-29861,";;
    n38) INPUT="1558 -30425" && OUTPUT="ret=1558,";;
    n37) INPUT="-18965 -17520" && OUTPUT="ret=-18965,";;
    n36) INPUT="17142 -9678" && OUTPUT="ret=17142,";;
    n35) INPUT="-13470 32158" && OUTPUT="ret=-13470,";;
    n34) INPUT="0 14709" && OUTPUT="ret=14709,";;
    n33) INPUT="8985 0" && OUTPUT="ret=8985,";;
    n32) INPUT="18385 30798" && OUTPUT="ret=18385,";;
    n31) INPUT="0 -1044" && OUTPUT="ret=-1044,";;
    n30) INPUT="24173 25449" && OUTPUT="ret=24173,";;
    n29) INPUT="20811 -10744" && OUTPUT="ret=20811,";;
    n28) INPUT="0 1182" && OUTPUT="ret=1182,";;
    n27) INPUT="12813 16009" && OUTPUT="ret=12813,";;
    n26) INPUT="11407 -17637" && OUTPUT="ret=11407,";;
    n25) INPUT="27551 0" && OUTPUT="ret=27551,";;
    n24) INPUT="0 -13859" && OUTPUT="ret=-13859,";;
    n23) INPUT="27357 22698" && OUTPUT="ret=27357,";;
    n22) INPUT="-29918 -21678" && OUTPUT="ret=-29918,";;
    n21) INPUT="-10611 24236" && OUTPUT="ret=-10611,";;
    n20) INPUT="7044 19138" && OUTPUT="ret=7044,";;
    n19) INPUT="-27892 -16689" && OUTPUT="ret=-27892,";;
    n18) INPUT="8239 0" && OUTPUT="ret=8239,";;
    n17) INPUT="29023 0" && OUTPUT="ret=29023,";;
    n16) INPUT="-31263 10392" && OUTPUT="ret=-31263,";;
    n15) INPUT="17335 0" && OUTPUT="ret=17335,";;
    n14) INPUT="0 -25571" && OUTPUT="ret=-25571,";;
    n13) INPUT="10718 17819" && OUTPUT="ret=10718,";;
    n12) INPUT="26749 9204" && OUTPUT="ret=26749,";;
    n11) INPUT="-24599 0" && OUTPUT="ret=-24599,";;
    n10) INPUT="0 -4626" && OUTPUT="ret=-4626,";;
    n9) INPUT="18300 -8421" && OUTPUT="ret=18300,";;
    n8) INPUT="10968 0" && OUTPUT="ret=10968,";;
    n7) INPUT="26163 11180" && OUTPUT="ret=26163,";;
    n6) INPUT="0 -438" && OUTPUT="ret=-438,";;
    n5) INPUT="-25288 0" && OUTPUT="ret=-25288,";;
    n4) INPUT="0 -22914" && OUTPUT="ret=-22914,";;
    n3) INPUT="26690 27124" && OUTPUT="ret=26690,";;
    n2) INPUT="-482 15117" && OUTPUT="ret=-482,";;
    n1) INPUT="0 0" && OUTPUT="ret=0,";;

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
