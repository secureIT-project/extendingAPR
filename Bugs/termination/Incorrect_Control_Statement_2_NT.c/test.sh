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

BREAKLINE=55
INTERESTING_VARIABLES=( EVENT_EPOLL_TABLES slots_used ereg table i )
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
    p72) INPUT="0 -1526" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-1526,i=0,";;
    p71) INPUT="31473 -26859" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-26859,i=0,";;
    p70) INPUT="14360 -11017" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-11017,i=0,";;
    p69) INPUT="0 32018" && OUTPUT="EVENT_EPOLL_TABLES=10,table=32018,i=0,";;
    p68) INPUT="-9462 24996" && OUTPUT="EVENT_EPOLL_TABLES=10,table=24996,i=0,";;
    p67) INPUT="-30119 10058" && OUTPUT="EVENT_EPOLL_TABLES=10,table=10058,i=0,";;
    p66) INPUT="-32262 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p65) INPUT="-15399 22212" && OUTPUT="EVENT_EPOLL_TABLES=10,table=22212,i=0,";;
    p64) INPUT="15143 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p63) INPUT="31835 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p62) INPUT="-27735 2825" && OUTPUT="EVENT_EPOLL_TABLES=10,table=2825,i=0,";;
    p61) INPUT="0 -22529" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-22529,i=0,";;
    p60) INPUT="-26597 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p59) INPUT="-19180 -8698" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-8698,i=0,";;
    p58) INPUT="0 -367" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-367,i=0,";;
    p57) INPUT="-16663 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p56) INPUT="12121 16076" && OUTPUT="EVENT_EPOLL_TABLES=10,table=16076,i=0,";;
    p55) INPUT="0 7789" && OUTPUT="EVENT_EPOLL_TABLES=10,table=7789,i=0,";;
    p54) INPUT="15106 30709" && OUTPUT="EVENT_EPOLL_TABLES=10,table=30709,i=0,";;
    p53) INPUT="0 -31699" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-31699,i=0,";;
    p52) INPUT="0 -21205" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-21205,i=0,";;
    p51) INPUT="22220 -9538" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-9538,i=0,";;
    p50) INPUT="8741 -4733" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-4733,i=0,";;
    p49) INPUT="4389 -18627" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-18627,i=0,";;
    p48) INPUT="0 10398" && OUTPUT="EVENT_EPOLL_TABLES=10,table=10398,i=0,";;
    p47) INPUT="0 29564" && OUTPUT="EVENT_EPOLL_TABLES=10,table=29564,i=0,";;
    p46) INPUT="0 32147" && OUTPUT="EVENT_EPOLL_TABLES=10,table=32147,i=0,";;
    p45) INPUT="12470 -18384" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-18384,i=0,";;
    p44) INPUT="-25968 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p43) INPUT="0 28773" && OUTPUT="EVENT_EPOLL_TABLES=10,table=28773,i=0,";;
    p42) INPUT="-26084 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p41) INPUT="20069 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p40) INPUT="-13964 -15010" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-15010,i=0,";;
    p39) INPUT="0 -29861" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-29861,i=0,";;
    p38) INPUT="1558 -30425" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-30425,i=0,";;
    p37) INPUT="-18965 -17520" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-17520,i=0,";;
    p36) INPUT="17142 -9678" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-9678,i=0,";;
    p35) INPUT="-13470 32158" && OUTPUT="EVENT_EPOLL_TABLES=10,table=32158,i=0,";;
    p34) INPUT="0 14709" && OUTPUT="EVENT_EPOLL_TABLES=10,table=14709,i=0,";;
    p33) INPUT="8985 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p32) INPUT="18385 30798" && OUTPUT="EVENT_EPOLL_TABLES=10,table=30798,i=0,";;
    p31) INPUT="0 -1044" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-1044,i=0,";;
    p30) INPUT="24173 25449" && OUTPUT="EVENT_EPOLL_TABLES=10,table=25449,i=0,";;
    p29) INPUT="20811 -10744" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-10744,i=0,";;
    p28) INPUT="0 1182" && OUTPUT="EVENT_EPOLL_TABLES=10,table=1182,i=0,";;
    p27) INPUT="12813 16009" && OUTPUT="EVENT_EPOLL_TABLES=10,table=16009,i=0,";;
    p26) INPUT="11407 -17637" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-17637,i=0,";;
    p25) INPUT="27551 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p24) INPUT="0 -13859" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-13859,i=0,";;
    p23) INPUT="27357 22698" && OUTPUT="EVENT_EPOLL_TABLES=10,table=22698,i=0,";;
    p22) INPUT="-29918 -21678" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-21678,i=0,";;
    p21) INPUT="-10611 24236" && OUTPUT="EVENT_EPOLL_TABLES=10,table=24236,i=0,";;
    p20) INPUT="7044 19138" && OUTPUT="EVENT_EPOLL_TABLES=10,table=19138,i=0,";;
    p19) INPUT="-27892 -16689" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-16689,i=0,";;
    p18) INPUT="8239 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p17) INPUT="29023 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p16) INPUT="-31263 10392" && OUTPUT="EVENT_EPOLL_TABLES=10,table=10392,i=0,";;
    p15) INPUT="17335 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p14) INPUT="0 -25571" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-25571,i=0,";;
    p13) INPUT="10718 17819" && OUTPUT="EVENT_EPOLL_TABLES=10,table=17819,i=0,";;
    p12) INPUT="26749 9204" && OUTPUT="EVENT_EPOLL_TABLES=10,table=9204,i=0,";;
    p11) INPUT="-24599 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p10) INPUT="0 -4626" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-4626,i=0,";;
    p9) INPUT="18300 -8421" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-8421,i=0,";;
    p8) INPUT="10968 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p7) INPUT="26163 11180" && OUTPUT="EVENT_EPOLL_TABLES=10,table=11180,i=0,";;
    p6) INPUT="0 -438" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-438,i=0,";;
    p5) INPUT="-25288 0" && OUTPUT="EVENT_EPOLL_TABLES=10,table=0,i=1,";;
    p4) INPUT="0 -22914" && OUTPUT="EVENT_EPOLL_TABLES=10,table=-22914,i=0,";;
    p3) INPUT="26690 27124" && OUTPUT="EVENT_EPOLL_TABLES=10,table=27124,i=0,";;
    p2) INPUT="-482 15117" && OUTPUT="EVENT_EPOLL_TABLES=10,table=15117,i=0,";;
    p1) INPUT="0 0" && OUTPUT="EVENT_EPOLL_TABLES=10,i=0,";;

    # Negative test cases:

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
