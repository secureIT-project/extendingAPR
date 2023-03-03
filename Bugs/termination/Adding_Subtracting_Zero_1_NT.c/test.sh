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

BREAKLINE=36
INTERESTING_VARIABLES=( linesToRead h )
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
    p64) INPUT="0 -1526" && OUTPUT="linesToRead=0,h=-1526,";;
    p63) INPUT="31473 -26859" && OUTPUT="linesToRead=31473,h=-26859,";;
    p62) INPUT="14360 -11017" && OUTPUT="linesToRead=14360,h=-11017,";;
    p61) INPUT="-9462 24996" && OUTPUT="linesToRead=-9462,";;
    p60) INPUT="-30119 10058" && OUTPUT="linesToRead=-30119,";;
    p59) INPUT="-32262 0" && OUTPUT="linesToRead=-32262,";;
    p58) INPUT="-15399 22212" && OUTPUT="linesToRead=-15399,";;
    p57) INPUT="15143 0" && OUTPUT="linesToRead=15143,h=0,";;
    p56) INPUT="31835 0" && OUTPUT="linesToRead=31835,h=0,";;
    p55) INPUT="-27735 2825" && OUTPUT="linesToRead=-27735,";;
    p54) INPUT="0 -22529" && OUTPUT="linesToRead=0,h=-22529,";;
    p53) INPUT="-26597 0" && OUTPUT="linesToRead=-26597,";;
    p52) INPUT="-19180 -8698" && OUTPUT="linesToRead=-19180,";;
    p51) INPUT="0 -367" && OUTPUT="linesToRead=0,h=-367,";;
    p50) INPUT="-16663 0" && OUTPUT="linesToRead=-16663,";;
    p49) INPUT="12121 16076" && OUTPUT="linesToRead=3955,h=0,";;
    p48) INPUT="15106 30709" && OUTPUT="linesToRead=497,h=0,";;
    p47) INPUT="0 -31699" && OUTPUT="linesToRead=0,h=-31699,";;
    p46) INPUT="0 -21205" && OUTPUT="linesToRead=0,h=-21205,";;
    p45) INPUT="22220 -9538" && OUTPUT="linesToRead=22220,h=-9538,";;
    p44) INPUT="8741 -4733" && OUTPUT="linesToRead=8741,h=-4733,";;
    p43) INPUT="4389 -18627" && OUTPUT="linesToRead=4389,h=-18627,";;
    p42) INPUT="12470 -18384" && OUTPUT="linesToRead=12470,h=-18384,";;
    p41) INPUT="-25968 0" && OUTPUT="linesToRead=-25968,";;
    p40) INPUT="-26084 0" && OUTPUT="linesToRead=-26084,";;
    p39) INPUT="20069 0" && OUTPUT="linesToRead=20069,h=0,";;
    p38) INPUT="-13964 -15010" && OUTPUT="linesToRead=-13964,";;
    p37) INPUT="0 -29861" && OUTPUT="linesToRead=0,h=-29861,";;
    p36) INPUT="1558 -30425" && OUTPUT="linesToRead=1558,h=-30425,";;
    p35) INPUT="-18965 -17520" && OUTPUT="linesToRead=-18965,";;
    p34) INPUT="17142 -9678" && OUTPUT="linesToRead=17142,h=-9678,";;
    p33) INPUT="-13470 32158" && OUTPUT="linesToRead=-13470,";;
    p32) INPUT="8985 0" && OUTPUT="linesToRead=8985,h=0,";;
    p31) INPUT="18385 30798" && OUTPUT="linesToRead=12413,h=0,";;
    p30) INPUT="0 -1044" && OUTPUT="linesToRead=0,h=-1044,";;
    p29) INPUT="24173 25449" && OUTPUT="linesToRead=1276,h=0,";;
    p28) INPUT="20811 -10744" && OUTPUT="linesToRead=20811,h=-10744,";;
    p27) INPUT="12813 16009" && OUTPUT="linesToRead=3196,h=0,";;
    p26) INPUT="11407 -17637" && OUTPUT="linesToRead=11407,h=-17637,";;
    p25) INPUT="27551 0" && OUTPUT="linesToRead=27551,h=0,";;
    p24) INPUT="0 -13859" && OUTPUT="linesToRead=0,h=-13859,";;
    p23) INPUT="27357 22698" && OUTPUT="linesToRead=22698,h=0,";;
    p22) INPUT="-29918 -21678" && OUTPUT="linesToRead=-29918,";;
    p21) INPUT="-10611 24236" && OUTPUT="linesToRead=-10611,";;
    p20) INPUT="7044 19138" && OUTPUT="linesToRead=5050,h=0,";;
    p19) INPUT="-27892 -16689" && OUTPUT="linesToRead=-27892,";;
    p18) INPUT="8239 0" && OUTPUT="linesToRead=8239,h=0,";;
    p17) INPUT="29023 0" && OUTPUT="linesToRead=29023,h=0,";;
    p16) INPUT="-31263 10392" && OUTPUT="linesToRead=-31263,";;
    p15) INPUT="17335 0" && OUTPUT="linesToRead=17335,h=0,";;
    p14) INPUT="0 -25571" && OUTPUT="linesToRead=0,h=-25571,";;
    p13) INPUT="10718 17819" && OUTPUT="linesToRead=7101,h=0,";;
    p12) INPUT="26749 9204" && OUTPUT="linesToRead=9204,h=0,";;
    p11) INPUT="-24599 0" && OUTPUT="linesToRead=-24599,";;
    p10) INPUT="0 -4626" && OUTPUT="linesToRead=0,h=-4626,";;
    p9) INPUT="18300 -8421" && OUTPUT="linesToRead=18300,h=-8421,";;
    p8) INPUT="10968 0" && OUTPUT="linesToRead=10968,h=0,";;
    p7) INPUT="26163 11180" && OUTPUT="linesToRead=11180,h=0,";;
    p6) INPUT="0 -438" && OUTPUT="linesToRead=0,h=-438,";;
    p5) INPUT="-25288 0" && OUTPUT="linesToRead=-25288,";;
    p4) INPUT="0 -22914" && OUTPUT="linesToRead=0,h=-22914,";;
    p3) INPUT="26690 27124" && OUTPUT="linesToRead=434,h=0,";;
    p2) INPUT="-482 15117" && OUTPUT="linesToRead=-482,";;
    p1) INPUT="0 0" && OUTPUT="linesToRead=0,h=0,";;

    # Negative test cases:
    n9) INPUT="0 32018" && OUTPUT="linesToRead=0,h=32018,";;
    n8) INPUT="0 7789" && OUTPUT="linesToRead=0,h=7789,";;
    n7) INPUT="0 10398" && OUTPUT="linesToRead=0,h=10398,";;
    n6) INPUT="0 29564" && OUTPUT="linesToRead=0,h=29564,";;
    n5) INPUT="0 32147" && OUTPUT="linesToRead=0,h=32147,";;
    n4) INPUT="0 28773" && OUTPUT="linesToRead=0,h=28773,";;
    n3) INPUT="0 14709" && OUTPUT="linesToRead=0,h=14709,";;
    n2) INPUT="0 1182" && OUTPUT="linesToRead=0,h=1182,";;
    n1) INPUT="0 1" && OUTPUT="";;

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
