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
INTERESTING_VARIABLES=( i j num_crtc num_output )
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
    p41) INPUT="0 -1526" && OUTPUT="i=0,num_crtc=0,num_output=-1526,";;
    p40) INPUT="0 32018" && OUTPUT="i=0,num_crtc=0,num_output=32018,";;
    p39) INPUT="-9462 24996" && OUTPUT="i=0,num_crtc=-9462,num_output=24996,";;
    p38) INPUT="-30119 10058" && OUTPUT="i=0,num_crtc=-30119,num_output=10058,";;
    p37) INPUT="-32262 0" && OUTPUT="i=0,num_crtc=-32262,num_output=0,";;
    p36) INPUT="-15399 22212" && OUTPUT="i=0,num_crtc=-15399,num_output=22212,";;
    p35) INPUT="-27735 2825" && OUTPUT="i=0,num_crtc=-27735,num_output=2825,";;
    p34) INPUT="0 -22529" && OUTPUT="i=0,num_crtc=0,num_output=-22529,";;
    p33) INPUT="-26597 0" && OUTPUT="i=0,num_crtc=-26597,num_output=0,";;
    p32) INPUT="-19180 -8698" && OUTPUT="i=0,num_crtc=-19180,num_output=-8698,";;
    p31) INPUT="0 -367" && OUTPUT="i=0,num_crtc=0,num_output=-367,";;
    p30) INPUT="-16663 0" && OUTPUT="i=0,num_crtc=-16663,num_output=0,";;
    p29) INPUT="0 7789" && OUTPUT="i=0,num_crtc=0,num_output=7789,";;
    p28) INPUT="0 -31699" && OUTPUT="i=0,num_crtc=0,num_output=-31699,";;
    p27) INPUT="0 -21205" && OUTPUT="i=0,num_crtc=0,num_output=-21205,";;
    p26) INPUT="0 10398" && OUTPUT="i=0,num_crtc=0,num_output=10398,";;
    p25) INPUT="0 29564" && OUTPUT="i=0,num_crtc=0,num_output=29564,";;
    p24) INPUT="0 32147" && OUTPUT="i=0,num_crtc=0,num_output=32147,";;
    p23) INPUT="-25968 0" && OUTPUT="i=0,num_crtc=-25968,num_output=0,";;
    p22) INPUT="0 28773" && OUTPUT="i=0,num_crtc=0,num_output=28773,";;
    p21) INPUT="-26084 0" && OUTPUT="i=0,num_crtc=-26084,num_output=0,";;
    p20) INPUT="-13964 -15010" && OUTPUT="i=0,num_crtc=-13964,num_output=-15010,";;
    p19) INPUT="0 -29861" && OUTPUT="i=0,num_crtc=0,num_output=-29861,";;
    p18) INPUT="-18965 -17520" && OUTPUT="i=0,num_crtc=-18965,num_output=-17520,";;
    p17) INPUT="-13470 32158" && OUTPUT="i=0,num_crtc=-13470,num_output=32158,";;
    p16) INPUT="0 14709" && OUTPUT="i=0,num_crtc=0,num_output=14709,";;
    p15) INPUT="0 -1044" && OUTPUT="i=0,num_crtc=0,num_output=-1044,";;
    p14) INPUT="0 1182" && OUTPUT="i=0,num_crtc=0,num_output=1182,";;
    p13) INPUT="0 -13859" && OUTPUT="i=0,num_crtc=0,num_output=-13859,";;
    p12) INPUT="-29918 -21678" && OUTPUT="i=0,num_crtc=-29918,num_output=-21678,";;
    p11) INPUT="-10611 24236" && OUTPUT="i=0,num_crtc=-10611,num_output=24236,";;
    p10) INPUT="-27892 -16689" && OUTPUT="i=0,num_crtc=-27892,num_output=-16689,";;
    p9) INPUT="-31263 10392" && OUTPUT="i=0,num_crtc=-31263,num_output=10392,";;
    p8) INPUT="0 -25571" && OUTPUT="i=0,num_crtc=0,num_output=-25571,";;
    p7) INPUT="-24599 0" && OUTPUT="i=0,num_crtc=-24599,num_output=0,";;
    p6) INPUT="0 -4626" && OUTPUT="i=0,num_crtc=0,num_output=-4626,";;
    p5) INPUT="0 -438" && OUTPUT="i=0,num_crtc=0,num_output=-438,";;
    p4) INPUT="-25288 0" && OUTPUT="i=0,num_crtc=-25288,num_output=0,";;
    p3) INPUT="0 -22914" && OUTPUT="i=0,num_crtc=0,num_output=-22914,";;
    p2) INPUT="-482 15117" && OUTPUT="i=0,num_crtc=-482,num_output=15117,";;
    p1) INPUT="0 0" && OUTPUT="i=0,num_crtc=0,num_output=0,";;

    # Negative test cases:
    n32) INPUT="31473 -26859" && OUTPUT="i=31473,j=0,num_crtc=31473,num_output=-26859,";;
    n31) INPUT="14360 -11017" && OUTPUT="i=14360,j=0,num_crtc=14360,num_output=-11017,";;
    n30) INPUT="15143 0" && OUTPUT="i=15143,j=0,num_crtc=15143,num_output=0,";;
    n29) INPUT="31835 0" && OUTPUT="i=31835,j=0,num_crtc=31835,num_output=0,";;
    n28) INPUT="12121 16076" && OUTPUT="i=12121,j=16076,num_crtc=12121,num_output=16076,";;
    n27) INPUT="15106 30709" && OUTPUT="i=15106,j=30709,num_crtc=15106,num_output=30709,";;
    n26) INPUT="22220 -9538" && OUTPUT="i=22220,j=0,num_crtc=22220,num_output=-9538,";;
    n25) INPUT="8741 -4733" && OUTPUT="i=8741,j=0,num_crtc=8741,num_output=-4733,";;
    n24) INPUT="4389 -18627" && OUTPUT="i=4389,j=0,num_crtc=4389,num_output=-18627,";;
    n23) INPUT="12470 -18384" && OUTPUT="i=12470,j=0,num_crtc=12470,num_output=-18384,";;
    n22) INPUT="20069 0" && OUTPUT="i=20069,j=0,num_crtc=20069,num_output=0,";;
    n21) INPUT="1558 -30425" && OUTPUT="i=1558,j=0,num_crtc=1558,num_output=-30425,";;
    n20) INPUT="17142 -9678" && OUTPUT="i=17142,j=0,num_crtc=17142,num_output=-9678,";;
    n19) INPUT="8985 0" && OUTPUT="i=8985,j=0,num_crtc=8985,num_output=0,";;
    n18) INPUT="18385 30798" && OUTPUT="i=18385,j=30798,num_crtc=18385,num_output=30798,";;
    n17) INPUT="24173 25449" && OUTPUT="i=24173,j=25449,num_crtc=24173,num_output=25449,";;
    n16) INPUT="20811 -10744" && OUTPUT="i=20811,j=0,num_crtc=20811,num_output=-10744,";;
    n15) INPUT="12813 16009" && OUTPUT="i=12813,j=16009,num_crtc=12813,num_output=16009,";;
    n14) INPUT="11407 -17637" && OUTPUT="i=11407,j=0,num_crtc=11407,num_output=-17637,";;
    n13) INPUT="27551 0" && OUTPUT="i=27551,j=0,num_crtc=27551,num_output=0,";;
    n12) INPUT="27357 22698" && OUTPUT="i=27357,j=22698,num_crtc=27357,num_output=22698,";;
    n11) INPUT="7044 19138" && OUTPUT="i=7044,j=19138,num_crtc=7044,num_output=19138,";;
    n10) INPUT="8239 0" && OUTPUT="i=8239,j=0,num_crtc=8239,num_output=0,";;
    n9) INPUT="29023 0" && OUTPUT="i=29023,j=0,num_crtc=29023,num_output=0,";;
    n8) INPUT="17335 0" && OUTPUT="i=17335,j=0,num_crtc=17335,num_output=0,";;
    n7) INPUT="10718 17819" && OUTPUT="i=10718,j=17819,num_crtc=10718,num_output=17819,";;
    n6) INPUT="26749 9204" && OUTPUT="i=26749,j=9204,num_crtc=26749,num_output=9204,";;
    n5) INPUT="18300 -8421" && OUTPUT="i=18300,j=0,num_crtc=18300,num_output=-8421,";;
    n4) INPUT="10968 0" && OUTPUT="i=10968,j=0,num_crtc=10968,num_output=0,";;
    n3) INPUT="26163 11180" && OUTPUT="i=26163,j=11180,num_crtc=26163,num_output=11180,";;
    n2) INPUT="26690 27124" && OUTPUT="i=26690,j=27124,num_crtc=26690,num_output=27124,";;
    n1) INPUT="2 0" && OUTPUT="";;

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
