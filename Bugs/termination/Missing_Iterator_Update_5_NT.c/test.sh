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

BREAKLINE=45
INTERESTING_VARIABLES=( MCE_LOG_LEN mcelog_entry entry )
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
    p160) INPUT="0 27404 -14455" && OUTPUT="";;
    p159) INPUT="17835 0 -13923" && OUTPUT="MCE_LOG_LEN=17835,";;
    p158) INPUT="-24031 0 -15427" && OUTPUT="MCE_LOG_LEN=-24031,";;
    p157) INPUT="-24758 2517 -4242" && OUTPUT="MCE_LOG_LEN=-24758,";;
    p156) INPUT="-32627 0 -6499" && OUTPUT="MCE_LOG_LEN=-32627,";;
    p155) INPUT="0 0 18489" && OUTPUT="";;
    p154) INPUT="-10072 30176 22124" && OUTPUT="MCE_LOG_LEN=-10072,";;
    p153) INPUT="8032 -16852 0" && OUTPUT="MCE_LOG_LEN=8032,";;
    p152) INPUT="0 0 -26004" && OUTPUT="";;
    p151) INPUT="-5849 30436 22660" && OUTPUT="MCE_LOG_LEN=-5849,";;
    p150) INPUT="12877 27312 -2758" && OUTPUT="MCE_LOG_LEN=12877,";;
    p149) INPUT="1159 -18290 14760" && OUTPUT="MCE_LOG_LEN=1159,";;
    p148) INPUT="-18729 -28753 0" && OUTPUT="MCE_LOG_LEN=-18729,";;
    p147) INPUT="0 25842 -4809" && OUTPUT="";;
    p146) INPUT="0 1389 -19588" && OUTPUT="";;
    p145) INPUT="0 25234 -16274" && OUTPUT="";;
    p144) INPUT="0 25670 0" && OUTPUT="";;
    p143) INPUT="-32504 21271 2462" && OUTPUT="MCE_LOG_LEN=-32504,";;
    p142) INPUT="0 -10757 7855" && OUTPUT="";;
    p141) INPUT="4884 0 0" && OUTPUT="MCE_LOG_LEN=4884,";;
    p140) INPUT="-27215 -28848 -18754" && OUTPUT="MCE_LOG_LEN=-27215,";;
    p139) INPUT="-6158 -8982 21087" && OUTPUT="MCE_LOG_LEN=-6158,";;
    p138) INPUT="12544 -26555 29648" && OUTPUT="MCE_LOG_LEN=12544,";;
    p137) INPUT="31850 0 -28445" && OUTPUT="MCE_LOG_LEN=31850,";;
    p136) INPUT="-9811 16662 -22896" && OUTPUT="MCE_LOG_LEN=-9811,";;
    p135) INPUT="0 23033 0" && OUTPUT="";;
    p134) INPUT="-14591 0 0" && OUTPUT="MCE_LOG_LEN=-14591,";;
    p133) INPUT="14901 -13874 -17607" && OUTPUT="MCE_LOG_LEN=14901,";;
    p132) INPUT="-15342 17498 1074" && OUTPUT="MCE_LOG_LEN=-15342,";;
    p131) INPUT="0 -15953 -26626" && OUTPUT="";;
    p130) INPUT="14695 0 0" && OUTPUT="MCE_LOG_LEN=14695,";;
    p129) INPUT="0 30035 -25797" && OUTPUT="";;
    p128) INPUT="-4117 -26497 0" && OUTPUT="MCE_LOG_LEN=-4117,";;
    p127) INPUT="0 -19509 0" && OUTPUT="";;
    p126) INPUT="1324 0 -24134" && OUTPUT="MCE_LOG_LEN=1324,";;
    p125) INPUT="8616 -7844 24192" && OUTPUT="MCE_LOG_LEN=8616,";;
    p124) INPUT="11183 -17425 0" && OUTPUT="MCE_LOG_LEN=11183,";;
    p123) INPUT="7673 14858 -10170" && OUTPUT="MCE_LOG_LEN=7673,";;
    p122) INPUT="10440 -2354 6262" && OUTPUT="MCE_LOG_LEN=10440,";;
    p121) INPUT="-267 0 24341" && OUTPUT="MCE_LOG_LEN=-267,";;
    p120) INPUT="11236 -16537 0" && OUTPUT="MCE_LOG_LEN=11236,";;
    p119) INPUT="0 13870 0" && OUTPUT="";;
    p118) INPUT="0 0 23119" && OUTPUT="";;
    p117) INPUT="20600 2160 0" && OUTPUT="MCE_LOG_LEN=20600,";;
    p116) INPUT="-19201 18061 17628" && OUTPUT="MCE_LOG_LEN=-19201,";;
    p115) INPUT="18903 0 11905" && OUTPUT="MCE_LOG_LEN=18903,";;
    p114) INPUT="22221 0 24708" && OUTPUT="MCE_LOG_LEN=22221,";;
    p113) INPUT="0 -6305 19389" && OUTPUT="";;
    p112) INPUT="31270 -14755 0" && OUTPUT="MCE_LOG_LEN=31270,";;
    p111) INPUT="30923 0 256" && OUTPUT="MCE_LOG_LEN=30923,";;
    p110) INPUT="-2295 0 28371" && OUTPUT="MCE_LOG_LEN=-2295,";;
    p109) INPUT="22713 4383 -29729" && OUTPUT="MCE_LOG_LEN=22713,";;
    p108) INPUT="0 0 -3499" && OUTPUT="";;
    p107) INPUT="10342 28489 0" && OUTPUT="MCE_LOG_LEN=10342,";;
    p106) INPUT="15554 -30259 31744" && OUTPUT="MCE_LOG_LEN=15554,";;
    p105) INPUT="-7345 0 80" && OUTPUT="MCE_LOG_LEN=-7345,";;
    p104) INPUT="0 24074 0" && OUTPUT="";;
    p103) INPUT="-1324 0 0" && OUTPUT="MCE_LOG_LEN=-1324,";;
    p102) INPUT="0 12982 0" && OUTPUT="";;
    p101) INPUT="0 22572 0" && OUTPUT="";;
    p100) INPUT="0 -22920 0" && OUTPUT="";;
    p99) INPUT="-11541 0 -30145" && OUTPUT="MCE_LOG_LEN=-11541,";;
    p98) INPUT="0 28132 0" && OUTPUT="";;
    p97) INPUT="-1352 12347 15670" && OUTPUT="MCE_LOG_LEN=-1352,";;
    p96) INPUT="-25909 30414 -11571" && OUTPUT="MCE_LOG_LEN=-25909,";;
    p95) INPUT="12180 0 13882" && OUTPUT="MCE_LOG_LEN=12180,";;
    p94) INPUT="17768 0 0" && OUTPUT="MCE_LOG_LEN=17768,";;
    p93) INPUT="9411 22238 -23501" && OUTPUT="MCE_LOG_LEN=9411,";;
    p92) INPUT="22896 -2508 0" && OUTPUT="MCE_LOG_LEN=22896,";;
    p91) INPUT="28718 13197 -20857" && OUTPUT="MCE_LOG_LEN=28718,";;
    p90) INPUT="0 0 10268" && OUTPUT="";;
    p89) INPUT="-23891 25355 0" && OUTPUT="MCE_LOG_LEN=-23891,";;
    p88) INPUT="-25238 18047 0" && OUTPUT="MCE_LOG_LEN=-25238,";;
    p87) INPUT="18226 -8937 21726" && OUTPUT="MCE_LOG_LEN=18226,";;
    p86) INPUT="-6246 -23410 12985" && OUTPUT="MCE_LOG_LEN=-6246,";;
    p85) INPUT="0 10998 -19412" && OUTPUT="";;
    p84) INPUT="0 22728 -20430" && OUTPUT="";;
    p83) INPUT="0 -30018 28462" && OUTPUT="";;
    p82) INPUT="-24707 -22955 0" && OUTPUT="MCE_LOG_LEN=-24707,";;
    p81) INPUT="13299 -6475 0" && OUTPUT="MCE_LOG_LEN=13299,";;
    p80) INPUT="0 1983 0" && OUTPUT="";;
    p79) INPUT="21797 -27422 28682" && OUTPUT="MCE_LOG_LEN=21797,";;
    p78) INPUT="-30257 0 5384" && OUTPUT="MCE_LOG_LEN=-30257,";;
    p77) INPUT="0 31935 0" && OUTPUT="";;
    p76) INPUT="0 11172 0" && OUTPUT="";;
    p75) INPUT="-11862 26121 -22620" && OUTPUT="MCE_LOG_LEN=-11862,";;
    p74) INPUT="24828 -1435 -29380" && OUTPUT="MCE_LOG_LEN=24828,";;
    p73) INPUT="26672 0 8892" && OUTPUT="MCE_LOG_LEN=26672,";;
    p72) INPUT="22332 0 -31346" && OUTPUT="MCE_LOG_LEN=22332,";;
    p71) INPUT="0 2292 30841" && OUTPUT="";;
    p70) INPUT="-11302 133 21808" && OUTPUT="MCE_LOG_LEN=-11302,";;
    p69) INPUT="13940 0 -3360" && OUTPUT="MCE_LOG_LEN=13940,";;
    p68) INPUT="0 -26169 30807" && OUTPUT="";;
    p67) INPUT="-13337 -30702 -4450" && OUTPUT="MCE_LOG_LEN=-13337,";;
    p66) INPUT="0 0 -17584" && OUTPUT="";;
    p65) INPUT="9825 -15074 0" && OUTPUT="MCE_LOG_LEN=9825,";;
    p64) INPUT="0 6564 18491" && OUTPUT="";;
    p63) INPUT="-14537 13629 20733" && OUTPUT="MCE_LOG_LEN=-14537,";;
    p62) INPUT="-16845 31231 0" && OUTPUT="MCE_LOG_LEN=-16845,";;
    p61) INPUT="26871 -23193 0" && OUTPUT="MCE_LOG_LEN=26871,";;
    p60) INPUT="9184 0 822" && OUTPUT="MCE_LOG_LEN=9184,";;
    p59) INPUT="-10458 -28155 0" && OUTPUT="MCE_LOG_LEN=-10458,";;
    p58) INPUT="-7343 0 0" && OUTPUT="MCE_LOG_LEN=-7343,";;
    p57) INPUT="0 -28204 0" && OUTPUT="";;
    p56) INPUT="0 -1526 6592" && OUTPUT="";;
    p55) INPUT="-11017 31473 -26859" && OUTPUT="MCE_LOG_LEN=-11017,";;
    p54) INPUT="0 32018 14360" && OUTPUT="";;
    p53) INPUT="10058 -9462 24996" && OUTPUT="MCE_LOG_LEN=10058,";;
    p52) INPUT="-32262 0 -30119" && OUTPUT="MCE_LOG_LEN=-32262,";;
    p51) INPUT="0 -15399 22212" && OUTPUT="";;
    p50) INPUT="15143 0 0" && OUTPUT="MCE_LOG_LEN=15143,";;
    p49) INPUT="2825 31835 0" && OUTPUT="MCE_LOG_LEN=2825,";;
    p48) INPUT="0 -22529 -27735" && OUTPUT="";;
    p47) INPUT="-8698 -26597 0" && OUTPUT="MCE_LOG_LEN=-8698,";;
    p46) INPUT="0 0 -19180" && OUTPUT="";;
    p45) INPUT="0 0 -367" && OUTPUT="";;
    p44) INPUT="0 0 -16663" && OUTPUT="";;
    p43) INPUT="16076 0 0" && OUTPUT="MCE_LOG_LEN=16076,";;
    p42) INPUT="0 7789 12121" && OUTPUT="";;
    p41) INPUT="-31699 15106 30709" && OUTPUT="MCE_LOG_LEN=-31699,";;
    p40) INPUT="0 0 -21205" && OUTPUT="";;
    p39) INPUT="22220 -9538 0" && OUTPUT="MCE_LOG_LEN=22220,";;
    p38) INPUT="-18627 8741 -4733" && OUTPUT="MCE_LOG_LEN=-18627,";;
    p37) INPUT="0 10398 4389" && OUTPUT="";;
    p36) INPUT="32147 0 29564" && OUTPUT="MCE_LOG_LEN=32147,";;
    p35) INPUT="12470 -18384 0" && OUTPUT="MCE_LOG_LEN=12470,";;
    p34) INPUT="28773 -25968 0" && OUTPUT="MCE_LOG_LEN=28773,";;
    p33) INPUT="0 -26084 0" && OUTPUT="";;
    p32) INPUT="-13964 -15010 20069" && OUTPUT="MCE_LOG_LEN=-13964,";;
    p31) INPUT="-30425 0 -29861" && OUTPUT="MCE_LOG_LEN=-30425,";;
    p30) INPUT="-18965 -17520 1558" && OUTPUT="MCE_LOG_LEN=-18965,";;
    p29) INPUT="-9678 0 0" && OUTPUT="MCE_LOG_LEN=-9678,";;
    p28) INPUT="-13470 32158 17142" && OUTPUT="MCE_LOG_LEN=-13470,";;
    p27) INPUT="0 0 14709" && OUTPUT="";;
    p26) INPUT="0 0 8985" && OUTPUT="";;
    p25) INPUT="30798 0 0" && OUTPUT="MCE_LOG_LEN=30798,";;
    p24) INPUT="0 -1044 18385" && OUTPUT="";;
    p23) INPUT="-10744 24173 25449" && OUTPUT="MCE_LOG_LEN=-10744,";;
    p22) INPUT="0 1182 20811" && OUTPUT="";;
    p21) INPUT="16009 0 0" && OUTPUT="MCE_LOG_LEN=16009,";;
    p20) INPUT="11407 -17637 12813" && OUTPUT="MCE_LOG_LEN=11407,";;
    p19) INPUT="-13859 27551 0" && OUTPUT="MCE_LOG_LEN=-13859,";;
    p18) INPUT="27357 22698 0" && OUTPUT="MCE_LOG_LEN=27357,";;
    p17) INPUT="24236 -29918 -21678" && OUTPUT="MCE_LOG_LEN=24236,";;
    p16) INPUT="7044 19138 -10611" && OUTPUT="MCE_LOG_LEN=7044,";;
    p15) INPUT="0 -27892 -16689" && OUTPUT="";;
    p14) INPUT="0 0 0" && OUTPUT="";;
    p13) INPUT="29023 0 8239" && OUTPUT="MCE_LOG_LEN=29023,";;
    p12) INPUT="10392 0 0" && OUTPUT="MCE_LOG_LEN=10392,";;
    p11) INPUT="17335 0 -31263" && OUTPUT="MCE_LOG_LEN=17335,";;
    p10) INPUT="17819 0 -25571" && OUTPUT="MCE_LOG_LEN=17819,";;
    p9) INPUT="26749 9204 10718" && OUTPUT="MCE_LOG_LEN=26749,";;
    p8) INPUT="0 -24599 0" && OUTPUT="";;
    p7) INPUT="0 -4626 0" && OUTPUT="";;
    p6) INPUT="0 18300 -8421" && OUTPUT="";;
    p5) INPUT="26163 11180 10968" && OUTPUT="MCE_LOG_LEN=26163,";;
    p4) INPUT="0 0 -438" && OUTPUT="";;
    p3) INPUT="0 -22914 -25288" && OUTPUT="";;
    p2) INPUT="15117 26690 27124" && OUTPUT="MCE_LOG_LEN=15117,";;
    p1) INPUT="0 0 -482" && OUTPUT="";;

    # Negative test cases:
    n3) INPUT="379 5686 0" && OUTPUT="MCE_LOG_LEN=379,entry=1,";;
    n2) INPUT="983 0 9194" && OUTPUT="MCE_LOG_LEN=983,entry=0,";;
    n1) INPUT="1  " && OUTPUT="";;

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
