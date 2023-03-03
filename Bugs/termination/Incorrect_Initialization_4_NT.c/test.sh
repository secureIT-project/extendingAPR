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
INTERESTING_VARIABLES=( h hash rehash i )
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
    p159) INPUT="0 27404 -14455" && OUTPUT="h=0,hash=27404,rehash=-14455,";;
    p158) INPUT="17835 0 -13923" && OUTPUT="h=17835,hash=0,rehash=-13923,";;
    p157) INPUT="-24031 0 -15427" && OUTPUT="h=-24031,hash=0,rehash=-15427,";;
    p156) INPUT="-24758 2517 -4242" && OUTPUT="h=-24758,hash=2517,rehash=-4242,";;
    p155) INPUT="-32627 0 -6499" && OUTPUT="h=-32627,hash=0,rehash=-6499,";;
    p154) INPUT="0 0 18489" && OUTPUT="h=0,hash=0,rehash=18489,";;
    p153) INPUT="-10072 30176 22124" && OUTPUT="h=-10072,hash=30176,rehash=22124,";;
    p152) INPUT="8032 -16852 0" && OUTPUT="h=8032,hash=-16852,";;
    p151) INPUT="0 0 -26004" && OUTPUT="h=0,hash=0,rehash=-26004,";;
    p150) INPUT="-5849 30436 22660" && OUTPUT="h=-5849,hash=30436,rehash=22660,";;
    p149) INPUT="12877 27312 -2758" && OUTPUT="h=12877,hash=27312,rehash=-2758,";;
    p148) INPUT="1159 -18290 14760" && OUTPUT="h=1159,hash=-18290,rehash=14760,";;
    p147) INPUT="-18729 -28753 0" && OUTPUT="h=-18729,hash=-28753,";;
    p146) INPUT="0 25842 -4809" && OUTPUT="h=0,hash=25842,rehash=-4809,";;
    p145) INPUT="0 1389 -19588" && OUTPUT="h=0,hash=1389,rehash=-19588,";;
    p144) INPUT="0 25234 -16274" && OUTPUT="h=0,hash=25234,rehash=-16274,";;
    p143) INPUT="0 25670 0" && OUTPUT="h=0,hash=25670,";;
    p142) INPUT="-32504 21271 2462" && OUTPUT="h=-32504,hash=21271,rehash=2462,";;
    p141) INPUT="0 -10757 7855" && OUTPUT="h=0,hash=-10757,rehash=7855,";;
    p140) INPUT="4884 0 0" && OUTPUT="h=4884,hash=0,";;
    p139) INPUT="-27215 -28848 -18754" && OUTPUT="h=-27215,hash=-28848,rehash=-18754,";;
    p138) INPUT="-6158 -8982 21087" && OUTPUT="h=-6158,hash=-8982,rehash=21087,";;
    p137) INPUT="12544 -26555 29648" && OUTPUT="h=12544,hash=-26555,rehash=29648,";;
    p136) INPUT="31850 0 -28445" && OUTPUT="h=31850,hash=0,rehash=-28445,";;
    p135) INPUT="-9811 16662 -22896" && OUTPUT="h=-9811,hash=16662,rehash=-22896,";;
    p134) INPUT="0 23033 0" && OUTPUT="h=0,hash=23033,";;
    p133) INPUT="-14591 0 0" && OUTPUT="h=-14591,hash=0,";;
    p132) INPUT="14901 -13874 -17607" && OUTPUT="h=14901,hash=-13874,rehash=-17607,";;
    p131) INPUT="-15342 17498 1074" && OUTPUT="h=-15342,hash=17498,rehash=1074,";;
    p130) INPUT="0 -15953 -26626" && OUTPUT="h=0,hash=-15953,rehash=-26626,";;
    p129) INPUT="14695 0 0" && OUTPUT="h=14695,hash=0,";;
    p128) INPUT="0 30035 -25797" && OUTPUT="h=0,hash=30035,rehash=-25797,";;
    p127) INPUT="-4117 -26497 0" && OUTPUT="h=-4117,hash=-26497,";;
    p126) INPUT="0 -19509 0" && OUTPUT="h=0,hash=-19509,";;
    p125) INPUT="1324 0 -24134" && OUTPUT="h=1324,hash=0,rehash=-24134,";;
    p124) INPUT="8616 -7844 24192" && OUTPUT="h=8616,hash=-7844,rehash=24192,";;
    p123) INPUT="11183 -17425 0" && OUTPUT="h=11183,hash=-17425,";;
    p122) INPUT="7673 14858 -10170" && OUTPUT="h=7673,hash=14858,rehash=-10170,";;
    p121) INPUT="10440 -2354 6262" && OUTPUT="h=10440,hash=-2354,rehash=6262,";;
    p120) INPUT="-267 0 24341" && OUTPUT="h=-267,hash=0,rehash=24341,";;
    p119) INPUT="11236 -16537 0" && OUTPUT="h=11236,hash=-16537,";;
    p118) INPUT="0 13870 0" && OUTPUT="h=0,hash=13870,";;
    p117) INPUT="0 0 23119" && OUTPUT="h=0,hash=0,rehash=23119,";;
    p116) INPUT="20600 2160 0" && OUTPUT="h=20600,hash=2160,";;
    p115) INPUT="-19201 18061 17628" && OUTPUT="h=-19201,hash=18061,rehash=17628,";;
    p114) INPUT="18903 0 11905" && OUTPUT="h=18903,hash=0,rehash=11905,";;
    p113) INPUT="22221 0 24708" && OUTPUT="h=22221,hash=0,rehash=24708,";;
    p112) INPUT="0 -6305 19389" && OUTPUT="h=0,hash=-6305,rehash=19389,";;
    p111) INPUT="31270 -14755 0" && OUTPUT="h=31270,hash=-14755,";;
    p110) INPUT="30923 0 256" && OUTPUT="h=30923,hash=0,rehash=256,";;
    p109) INPUT="-2295 0 28371" && OUTPUT="h=-2295,hash=0,rehash=28371,";;
    p108) INPUT="22713 4383 -29729" && OUTPUT="h=22713,hash=4383,rehash=-29729,";;
    p107) INPUT="0 0 -3499" && OUTPUT="h=0,hash=0,rehash=-3499,";;
    p106) INPUT="10342 28489 0" && OUTPUT="h=10342,hash=28489,";;
    p105) INPUT="15554 -30259 31744" && OUTPUT="h=15554,hash=-30259,rehash=31744,";;
    p104) INPUT="-7345 0 80" && OUTPUT="h=-7345,hash=0,rehash=80,";;
    p103) INPUT="0 24074 0" && OUTPUT="h=0,hash=24074,";;
    p102) INPUT="-1324 0 0" && OUTPUT="h=-1324,hash=0,";;
    p101) INPUT="379 5686 0" && OUTPUT="h=379,hash=5686,";;
    p100) INPUT="0 12982 0" && OUTPUT="h=0,hash=12982,";;
    p99) INPUT="0 22572 0" && OUTPUT="h=0,hash=22572,";;
    p98) INPUT="0 -22920 0" && OUTPUT="h=0,hash=-22920,";;
    p97) INPUT="-11541 0 -30145" && OUTPUT="h=-11541,hash=0,rehash=-30145,";;
    p96) INPUT="0 28132 0" && OUTPUT="h=0,hash=28132,";;
    p95) INPUT="-1352 12347 15670" && OUTPUT="h=-1352,hash=12347,rehash=15670,";;
    p94) INPUT="-25909 30414 -11571" && OUTPUT="h=-25909,hash=30414,rehash=-11571,";;
    p93) INPUT="12180 0 13882" && OUTPUT="h=12180,hash=0,rehash=13882,";;
    p92) INPUT="17768 0 0" && OUTPUT="h=17768,hash=0,";;
    p91) INPUT="9411 22238 -23501" && OUTPUT="h=9411,hash=22238,rehash=-23501,";;
    p90) INPUT="22896 -2508 0" && OUTPUT="h=22896,hash=-2508,";;
    p89) INPUT="28718 13197 -20857" && OUTPUT="h=28718,hash=13197,rehash=-20857,";;
    p88) INPUT="0 0 10268" && OUTPUT="h=0,hash=0,rehash=10268,";;
    p87) INPUT="-23891 25355 0" && OUTPUT="h=-23891,hash=25355,";;
    p86) INPUT="-25238 18047 0" && OUTPUT="h=-25238,hash=18047,";;
    p85) INPUT="18226 -8937 21726" && OUTPUT="h=18226,hash=-8937,rehash=21726,";;
    p84) INPUT="-6246 -23410 12985" && OUTPUT="h=-6246,hash=-23410,rehash=12985,";;
    p83) INPUT="0 10998 -19412" && OUTPUT="h=0,hash=10998,rehash=-19412,";;
    p82) INPUT="0 22728 -20430" && OUTPUT="h=0,hash=22728,rehash=-20430,";;
    p81) INPUT="0 -30018 28462" && OUTPUT="h=0,hash=-30018,rehash=28462,";;
    p80) INPUT="-24707 -22955 0" && OUTPUT="h=-24707,hash=-22955,";;
    p79) INPUT="13299 -6475 0" && OUTPUT="h=13299,hash=-6475,";;
    p78) INPUT="0 1983 0" && OUTPUT="h=0,hash=1983,";;
    p77) INPUT="21797 -27422 28682" && OUTPUT="h=21797,hash=-27422,rehash=28682,";;
    p76) INPUT="-30257 0 5384" && OUTPUT="h=-30257,hash=0,rehash=5384,";;
    p75) INPUT="0 31935 0" && OUTPUT="h=0,hash=31935,";;
    p74) INPUT="0 11172 0" && OUTPUT="h=0,hash=11172,";;
    p73) INPUT="-11862 26121 -22620" && OUTPUT="h=-11862,hash=26121,rehash=-22620,";;
    p72) INPUT="24828 -1435 -29380" && OUTPUT="h=24828,hash=-1435,rehash=-29380,";;
    p71) INPUT="26672 0 8892" && OUTPUT="h=26672,hash=0,rehash=8892,";;
    p70) INPUT="22332 0 -31346" && OUTPUT="h=22332,hash=0,rehash=-31346,";;
    p69) INPUT="0 2292 30841" && OUTPUT="h=0,hash=2292,rehash=30841,";;
    p68) INPUT="-11302 133 21808" && OUTPUT="h=-11302,hash=133,rehash=21808,";;
    p67) INPUT="13940 0 -3360" && OUTPUT="h=13940,hash=0,rehash=-3360,";;
    p66) INPUT="0 -26169 30807" && OUTPUT="h=0,hash=-26169,rehash=30807,";;
    p65) INPUT="-13337 -30702 -4450" && OUTPUT="h=-13337,hash=-30702,rehash=-4450,";;
    p64) INPUT="0 0 -17584" && OUTPUT="h=0,hash=0,rehash=-17584,";;
    p63) INPUT="9825 -15074 0" && OUTPUT="h=9825,hash=-15074,";;
    p62) INPUT="0 6564 18491" && OUTPUT="h=0,hash=6564,rehash=18491,";;
    p61) INPUT="-14537 13629 20733" && OUTPUT="h=-14537,hash=13629,rehash=20733,";;
    p60) INPUT="-16845 31231 0" && OUTPUT="h=-16845,hash=31231,";;
    p59) INPUT="26871 -23193 0" && OUTPUT="h=26871,hash=-23193,";;
    p58) INPUT="9184 0 822" && OUTPUT="h=9184,hash=0,rehash=822,";;
    p57) INPUT="-10458 -28155 0" && OUTPUT="h=-10458,hash=-28155,";;
    p56) INPUT="-7343 0 0" && OUTPUT="h=-7343,hash=0,";;
    p55) INPUT="983 0 9194" && OUTPUT="h=983,hash=0,rehash=9194,";;
    p54) INPUT="0 -28204 0" && OUTPUT="h=0,hash=-28204,";;
    p53) INPUT="0 -1526 6592" && OUTPUT="h=0,hash=-1526,rehash=6592,";;
    p52) INPUT="-11017 31473 -26859" && OUTPUT="h=-11017,hash=31473,rehash=-26859,";;
    p51) INPUT="10058 -9462 24996" && OUTPUT="h=10058,hash=-9462,rehash=24996,";;
    p50) INPUT="-32262 0 -30119" && OUTPUT="h=-32262,hash=0,rehash=-30119,";;
    p49) INPUT="0 -15399 22212" && OUTPUT="h=0,hash=-15399,rehash=22212,";;
    p48) INPUT="15143 0 0" && OUTPUT="h=15143,hash=0,";;
    p47) INPUT="2825 31835 0" && OUTPUT="h=2825,hash=31835,";;
    p46) INPUT="0 -22529 -27735" && OUTPUT="h=0,hash=-22529,rehash=-27735,";;
    p45) INPUT="-8698 -26597 0" && OUTPUT="h=-8698,hash=-26597,";;
    p44) INPUT="0 0 -19180" && OUTPUT="h=0,hash=0,rehash=-19180,";;
    p43) INPUT="0 0 -367" && OUTPUT="h=0,hash=0,rehash=-367,";;
    p42) INPUT="0 0 -16663" && OUTPUT="h=0,hash=0,rehash=-16663,";;
    p41) INPUT="16076 0 0" && OUTPUT="h=16076,hash=0,";;
    p40) INPUT="0 7789 12121" && OUTPUT="h=0,hash=7789,rehash=12121,";;
    p39) INPUT="-31699 15106 30709" && OUTPUT="h=-31699,hash=15106,rehash=30709,";;
    p38) INPUT="0 0 -21205" && OUTPUT="h=0,hash=0,rehash=-21205,";;
    p37) INPUT="22220 -9538 0" && OUTPUT="h=22220,hash=-9538,";;
    p36) INPUT="-18627 8741 -4733" && OUTPUT="h=-18627,hash=8741,rehash=-4733,";;
    p35) INPUT="32147 0 29564" && OUTPUT="h=32147,hash=0,rehash=29564,";;
    p34) INPUT="12470 -18384 0" && OUTPUT="h=12470,hash=-18384,";;
    p33) INPUT="28773 -25968 0" && OUTPUT="h=28773,hash=-25968,";;
    p32) INPUT="0 -26084 0" && OUTPUT="h=0,hash=-26084,";;
    p31) INPUT="-13964 -15010 20069" && OUTPUT="h=-13964,hash=-15010,rehash=20069,";;
    p30) INPUT="-30425 0 -29861" && OUTPUT="h=-30425,hash=0,rehash=-29861,";;
    p29) INPUT="-18965 -17520 1558" && OUTPUT="h=-18965,hash=-17520,rehash=1558,";;
    p28) INPUT="-9678 0 0" && OUTPUT="h=-9678,hash=0,";;
    p27) INPUT="-13470 32158 17142" && OUTPUT="h=-13470,hash=32158,rehash=17142,";;
    p26) INPUT="0 0 14709" && OUTPUT="h=0,hash=0,rehash=14709,";;
    p25) INPUT="0 0 8985" && OUTPUT="h=0,hash=0,rehash=8985,";;
    p24) INPUT="30798 0 0" && OUTPUT="h=30798,hash=0,";;
    p23) INPUT="0 -1044 18385" && OUTPUT="h=0,hash=-1044,rehash=18385,";;
    p22) INPUT="-10744 24173 25449" && OUTPUT="h=-10744,hash=24173,rehash=25449,";;
    p21) INPUT="0 1182 20811" && OUTPUT="h=0,hash=1182,rehash=20811,";;
    p20) INPUT="16009 0 0" && OUTPUT="h=16009,hash=0,";;
    p19) INPUT="11407 -17637 12813" && OUTPUT="h=11407,hash=-17637,rehash=12813,";;
    p18) INPUT="-13859 27551 0" && OUTPUT="h=-13859,hash=27551,";;
    p17) INPUT="27357 22698 0" && OUTPUT="h=27357,hash=22698,";;
    p16) INPUT="24236 -29918 -21678" && OUTPUT="h=24236,hash=-29918,rehash=-21678,";;
    p15) INPUT="7044 19138 -10611" && OUTPUT="h=7044,hash=19138,rehash=-10611,";;
    p14) INPUT="0 -27892 -16689" && OUTPUT="h=0,hash=-27892,rehash=-16689,";;
    p13) INPUT="0 0 0" && OUTPUT="h=0,hash=0,";;
    p12) INPUT="29023 0 8239" && OUTPUT="h=29023,hash=0,rehash=8239,";;
    p11) INPUT="10392 0 0" && OUTPUT="h=10392,hash=0,";;
    p10) INPUT="17335 0 -31263" && OUTPUT="h=17335,hash=0,rehash=-31263,";;
    p9) INPUT="17819 0 -25571" && OUTPUT="h=17819,hash=0,rehash=-25571,";;
    p8) INPUT="26749 9204 10718" && OUTPUT="h=26749,hash=9204,rehash=10718,";;
    p7) INPUT="0 -24599 0" && OUTPUT="h=0,hash=-24599,";;
    p6) INPUT="0 -4626 0" && OUTPUT="h=0,hash=-4626,";;
    p5) INPUT="0 18300 -8421" && OUTPUT="h=0,hash=18300,rehash=-8421,";;
    p4) INPUT="0 0 -438" && OUTPUT="h=0,hash=0,rehash=-438,";;
    p3) INPUT="0 -22914 -25288" && OUTPUT="h=0,hash=-22914,rehash=-25288,";;
    p2) INPUT="15117 26690 27124" && OUTPUT="h=15117,hash=26690,rehash=27124,";;
    p1) INPUT="0 0 -482" && OUTPUT="h=0,hash=0,rehash=-482,";;

    # Negative test cases:
    n3) INPUT="0 32018 14360" && OUTPUT="h=0,hash=32018,rehash=14360,i=32018,";;
    n2) INPUT="0 10398 4389" && OUTPUT="h=0,hash=10398,rehash=4389,i=10398,";;
    n1) INPUT="26163 11180 10968" && OUTPUT="h=26163,hash=11180,rehash=10968,i=12259,";;

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
