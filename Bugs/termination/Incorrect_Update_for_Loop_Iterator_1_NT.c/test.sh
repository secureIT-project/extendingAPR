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

BREAKLINE=38
INTERESTING_VARIABLES=( max_msg_size buffer_read_offset buffer_bytes_left size )
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
    p147) INPUT="0 27404 -14455" && OUTPUT="max_msg_size=0,buffer_read_offset=27404,buffer_bytes_left=-14455,";;
    p146) INPUT="17835 0 -13923" && OUTPUT="max_msg_size=17835,buffer_read_offset=0,buffer_bytes_left=-13923,";;
    p145) INPUT="-24031 0 -15427" && OUTPUT="max_msg_size=-24031,buffer_read_offset=0,buffer_bytes_left=-15427,";;
    p144) INPUT="-24758 2517 -4242" && OUTPUT="max_msg_size=-24758,buffer_read_offset=2517,buffer_bytes_left=-4242,";;
    p143) INPUT="-32627 0 -6499" && OUTPUT="max_msg_size=-32627,buffer_read_offset=0,buffer_bytes_left=-6499,";;
    p142) INPUT="0 0 18489" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=18489,";;
    p141) INPUT="-10072 30176 22124" && OUTPUT="max_msg_size=-10072,buffer_read_offset=30176,buffer_bytes_left=22124,";;
    p140) INPUT="8032 -16852 0" && OUTPUT="max_msg_size=8032,buffer_read_offset=-16852,buffer_bytes_left=0,";;
    p139) INPUT="0 0 -26004" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-26004,";;
    p138) INPUT="-5849 30436 22660" && OUTPUT="max_msg_size=-5849,buffer_read_offset=30436,buffer_bytes_left=22660,";;
    p137) INPUT="12877 27312 -2758" && OUTPUT="max_msg_size=12877,buffer_read_offset=27312,buffer_bytes_left=-2758,";;
    p136) INPUT="1159 -18290 14760" && OUTPUT="max_msg_size=1159,buffer_read_offset=-18290,buffer_bytes_left=14760,";;
    p135) INPUT="-18729 -28753 0" && OUTPUT="max_msg_size=-18729,buffer_read_offset=-28753,buffer_bytes_left=0,";;
    p134) INPUT="0 25842 -4809" && OUTPUT="max_msg_size=0,buffer_read_offset=25842,buffer_bytes_left=-4809,";;
    p133) INPUT="0 1389 -19588" && OUTPUT="max_msg_size=0,buffer_read_offset=1389,buffer_bytes_left=-19588,";;
    p132) INPUT="0 25234 -16274" && OUTPUT="max_msg_size=0,buffer_read_offset=25234,buffer_bytes_left=-16274,";;
    p131) INPUT="-32504 21271 2462" && OUTPUT="max_msg_size=-32504,buffer_read_offset=21271,buffer_bytes_left=2462,";;
    p130) INPUT="0 -10757 7855" && OUTPUT="max_msg_size=0,buffer_read_offset=-10757,buffer_bytes_left=7855,";;
    p129) INPUT="4884 0 0" && OUTPUT="max_msg_size=4884,buffer_read_offset=0,buffer_bytes_left=0,";;
    p128) INPUT="-27215 -28848 -18754" && OUTPUT="max_msg_size=-27215,buffer_read_offset=-28848,buffer_bytes_left=-18754,";;
    p127) INPUT="-6158 -8982 21087" && OUTPUT="max_msg_size=-6158,buffer_read_offset=-8982,buffer_bytes_left=21087,";;
    p126) INPUT="12544 -26555 29648" && OUTPUT="max_msg_size=12544,buffer_read_offset=-26555,buffer_bytes_left=29648,";;
    p125) INPUT="31850 0 -28445" && OUTPUT="max_msg_size=31850,buffer_read_offset=0,buffer_bytes_left=-28445,";;
    p124) INPUT="-9811 16662 -22896" && OUTPUT="max_msg_size=-9811,buffer_read_offset=16662,buffer_bytes_left=-22896,";;
    p123) INPUT="-14591 0 0" && OUTPUT="max_msg_size=-14591,buffer_read_offset=0,buffer_bytes_left=0,";;
    p122) INPUT="14901 -13874 -17607" && OUTPUT="max_msg_size=14901,buffer_read_offset=-13874,buffer_bytes_left=-17607,";;
    p121) INPUT="-15342 17498 1074" && OUTPUT="max_msg_size=-15342,buffer_read_offset=17498,buffer_bytes_left=1074,";;
    p120) INPUT="0 -15953 -26626" && OUTPUT="max_msg_size=0,buffer_read_offset=-15953,buffer_bytes_left=-26626,";;
    p119) INPUT="14695 0 0" && OUTPUT="max_msg_size=14695,buffer_read_offset=0,buffer_bytes_left=0,";;
    p118) INPUT="0 30035 -25797" && OUTPUT="max_msg_size=0,buffer_read_offset=30035,buffer_bytes_left=-25797,";;
    p117) INPUT="-4117 -26497 0" && OUTPUT="max_msg_size=-4117,buffer_read_offset=-26497,buffer_bytes_left=0,";;
    p116) INPUT="0 -19509 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-19509,buffer_bytes_left=0,";;
    p115) INPUT="1324 0 -24134" && OUTPUT="max_msg_size=1324,buffer_read_offset=0,buffer_bytes_left=-24134,";;
    p114) INPUT="8616 -7844 24192" && OUTPUT="max_msg_size=8616,buffer_read_offset=-7844,buffer_bytes_left=24192,";;
    p113) INPUT="11183 -17425 0" && OUTPUT="max_msg_size=11183,buffer_read_offset=-17425,buffer_bytes_left=0,";;
    p112) INPUT="7673 14858 -10170" && OUTPUT="max_msg_size=7673,buffer_read_offset=14858,buffer_bytes_left=-10170,";;
    p111) INPUT="10440 -2354 6262" && OUTPUT="max_msg_size=10440,buffer_read_offset=-2354,buffer_bytes_left=6262,";;
    p110) INPUT="-267 0 24341" && OUTPUT="max_msg_size=-267,buffer_read_offset=0,buffer_bytes_left=24341,";;
    p109) INPUT="11236 -16537 0" && OUTPUT="max_msg_size=11236,buffer_read_offset=-16537,buffer_bytes_left=0,";;
    p108) INPUT="0 0 23119" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=23119,";;
    p107) INPUT="-19201 18061 17628" && OUTPUT="max_msg_size=-19201,buffer_read_offset=18061,buffer_bytes_left=17628,";;
    p106) INPUT="18903 0 11905" && OUTPUT="max_msg_size=18903,buffer_read_offset=0,buffer_bytes_left=11905,";;
    p105) INPUT="22221 0 24708" && OUTPUT="max_msg_size=22221,buffer_read_offset=0,buffer_bytes_left=24708,";;
    p104) INPUT="0 -6305 19389" && OUTPUT="max_msg_size=0,buffer_read_offset=-6305,buffer_bytes_left=19389,";;
    p103) INPUT="31270 -14755 0" && OUTPUT="max_msg_size=31270,buffer_read_offset=-14755,buffer_bytes_left=0,";;
    p102) INPUT="30923 0 256" && OUTPUT="max_msg_size=30923,buffer_read_offset=0,buffer_bytes_left=256,";;
    p101) INPUT="-2295 0 28371" && OUTPUT="max_msg_size=-2295,buffer_read_offset=0,buffer_bytes_left=28371,";;
    p100) INPUT="22713 4383 -29729" && OUTPUT="max_msg_size=22713,buffer_read_offset=4383,buffer_bytes_left=-29729,";;
    p99) INPUT="0 0 -3499" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-3499,";;
    p98) INPUT="15554 -30259 31744" && OUTPUT="max_msg_size=15554,buffer_read_offset=-30259,buffer_bytes_left=31744,";;
    p97) INPUT="-7345 0 80" && OUTPUT="max_msg_size=-7345,buffer_read_offset=0,buffer_bytes_left=80,";;
    p96) INPUT="-1324 0 0" && OUTPUT="max_msg_size=-1324,buffer_read_offset=0,buffer_bytes_left=0,";;
    p95) INPUT="0 -22920 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-22920,buffer_bytes_left=0,";;
    p94) INPUT="-11541 0 -30145" && OUTPUT="max_msg_size=-11541,buffer_read_offset=0,buffer_bytes_left=-30145,";;
    p93) INPUT="-1352 12347 15670" && OUTPUT="max_msg_size=-1352,buffer_read_offset=12347,buffer_bytes_left=15670,";;
    p92) INPUT="-25909 30414 -11571" && OUTPUT="max_msg_size=-25909,buffer_read_offset=30414,buffer_bytes_left=-11571,";;
    p91) INPUT="12180 0 13882" && OUTPUT="max_msg_size=12180,buffer_read_offset=0,buffer_bytes_left=13882,";;
    p90) INPUT="17768 0 0" && OUTPUT="max_msg_size=17768,buffer_read_offset=0,buffer_bytes_left=0,";;
    p89) INPUT="9411 22238 -23501" && OUTPUT="max_msg_size=9411,buffer_read_offset=22238,buffer_bytes_left=-23501,";;
    p88) INPUT="22896 -2508 0" && OUTPUT="max_msg_size=22896,buffer_read_offset=-2508,buffer_bytes_left=0,";;
    p87) INPUT="28718 13197 -20857" && OUTPUT="max_msg_size=28718,buffer_read_offset=13197,buffer_bytes_left=-20857,";;
    p86) INPUT="0 0 10268" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=10268,";;
    p85) INPUT="-23891 25355 0" && OUTPUT="max_msg_size=-23891,buffer_read_offset=25355,buffer_bytes_left=0,";;
    p84) INPUT="-25238 18047 0" && OUTPUT="max_msg_size=-25238,buffer_read_offset=18047,buffer_bytes_left=0,";;
    p83) INPUT="18226 -8937 21726" && OUTPUT="max_msg_size=18226,buffer_read_offset=-8937,buffer_bytes_left=21726,";;
    p82) INPUT="-6246 -23410 12985" && OUTPUT="max_msg_size=-6246,buffer_read_offset=-23410,buffer_bytes_left=12985,";;
    p81) INPUT="0 10998 -19412" && OUTPUT="max_msg_size=0,buffer_read_offset=10998,buffer_bytes_left=-19412,";;
    p80) INPUT="0 22728 -20430" && OUTPUT="max_msg_size=0,buffer_read_offset=22728,buffer_bytes_left=-20430,";;
    p79) INPUT="0 -30018 28462" && OUTPUT="max_msg_size=0,buffer_read_offset=-30018,buffer_bytes_left=28462,";;
    p78) INPUT="-24707 -22955 0" && OUTPUT="max_msg_size=-24707,buffer_read_offset=-22955,buffer_bytes_left=0,";;
    p77) INPUT="13299 -6475 0" && OUTPUT="max_msg_size=13299,buffer_read_offset=-6475,buffer_bytes_left=0,";;
    p76) INPUT="21797 -27422 28682" && OUTPUT="max_msg_size=21797,buffer_read_offset=-27422,buffer_bytes_left=28682,";;
    p75) INPUT="-30257 0 5384" && OUTPUT="max_msg_size=-30257,buffer_read_offset=0,buffer_bytes_left=5384,";;
    p74) INPUT="-11862 26121 -22620" && OUTPUT="max_msg_size=-11862,buffer_read_offset=26121,buffer_bytes_left=-22620,";;
    p73) INPUT="24828 -1435 -29380" && OUTPUT="max_msg_size=24828,buffer_read_offset=-1435,buffer_bytes_left=-29380,";;
    p72) INPUT="26672 0 8892" && OUTPUT="max_msg_size=26672,buffer_read_offset=0,buffer_bytes_left=8892,";;
    p71) INPUT="22332 0 -31346" && OUTPUT="max_msg_size=22332,buffer_read_offset=0,buffer_bytes_left=-31346,";;
    p70) INPUT="0 2292 30841" && OUTPUT="max_msg_size=0,buffer_read_offset=2292,buffer_bytes_left=30841,size=64,";;
    p69) INPUT="-11302 133 21808" && OUTPUT="max_msg_size=-11302,buffer_read_offset=133,buffer_bytes_left=21808,";;
    p68) INPUT="13940 0 -3360" && OUTPUT="max_msg_size=13940,buffer_read_offset=0,buffer_bytes_left=-3360,";;
    p67) INPUT="0 -26169 30807" && OUTPUT="max_msg_size=0,buffer_read_offset=-26169,buffer_bytes_left=30807,";;
    p66) INPUT="-13337 -30702 -4450" && OUTPUT="max_msg_size=-13337,buffer_read_offset=-30702,buffer_bytes_left=-4450,";;
    p65) INPUT="0 0 -17584" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-17584,";;
    p64) INPUT="9825 -15074 0" && OUTPUT="max_msg_size=9825,buffer_read_offset=-15074,buffer_bytes_left=0,";;
    p63) INPUT="0 6564 18491" && OUTPUT="max_msg_size=0,buffer_read_offset=6564,buffer_bytes_left=18491,size=64,";;
    p62) INPUT="-14537 13629 20733" && OUTPUT="max_msg_size=-14537,buffer_read_offset=13629,buffer_bytes_left=20733,";;
    p61) INPUT="-16845 31231 0" && OUTPUT="max_msg_size=-16845,buffer_read_offset=31231,buffer_bytes_left=0,";;
    p60) INPUT="26871 -23193 0" && OUTPUT="max_msg_size=26871,buffer_read_offset=-23193,buffer_bytes_left=0,";;
    p59) INPUT="9184 0 822" && OUTPUT="max_msg_size=9184,buffer_read_offset=0,buffer_bytes_left=822,";;
    p58) INPUT="-10458 -28155 0" && OUTPUT="max_msg_size=-10458,buffer_read_offset=-28155,buffer_bytes_left=0,";;
    p57) INPUT="-7343 0 0" && OUTPUT="max_msg_size=-7343,buffer_read_offset=0,buffer_bytes_left=0,";;
    p56) INPUT="983 0 9194" && OUTPUT="max_msg_size=983,buffer_read_offset=0,buffer_bytes_left=9194,";;
    p55) INPUT="0 -28204 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-28204,buffer_bytes_left=0,";;
    p54) INPUT="0 -1526 6592" && OUTPUT="max_msg_size=0,buffer_read_offset=-1526,buffer_bytes_left=6592,";;
    p53) INPUT="-11017 31473 -26859" && OUTPUT="max_msg_size=-11017,buffer_read_offset=31473,buffer_bytes_left=-26859,";;
    p52) INPUT="0 32018 14360" && OUTPUT="max_msg_size=0,buffer_read_offset=32018,buffer_bytes_left=14360,size=64,";;
    p51) INPUT="10058 -9462 24996" && OUTPUT="max_msg_size=10058,buffer_read_offset=-9462,buffer_bytes_left=24996,";;
    p50) INPUT="-32262 0 -30119" && OUTPUT="max_msg_size=-32262,buffer_read_offset=0,buffer_bytes_left=-30119,";;
    p49) INPUT="0 -15399 22212" && OUTPUT="max_msg_size=0,buffer_read_offset=-15399,buffer_bytes_left=22212,";;
    p48) INPUT="15143 0 0" && OUTPUT="max_msg_size=15143,buffer_read_offset=0,buffer_bytes_left=0,";;
    p47) INPUT="0 -22529 -27735" && OUTPUT="max_msg_size=0,buffer_read_offset=-22529,buffer_bytes_left=-27735,";;
    p46) INPUT="-8698 -26597 0" && OUTPUT="max_msg_size=-8698,buffer_read_offset=-26597,buffer_bytes_left=0,";;
    p45) INPUT="0 0 -19180" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-19180,";;
    p44) INPUT="0 0 -367" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-367,";;
    p43) INPUT="0 0 -16663" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-16663,";;
    p42) INPUT="16076 0 0" && OUTPUT="max_msg_size=16076,buffer_read_offset=0,buffer_bytes_left=0,";;
    p41) INPUT="0 7789 12121" && OUTPUT="max_msg_size=0,buffer_read_offset=7789,buffer_bytes_left=12121,size=64,";;
    p40) INPUT="-31699 15106 30709" && OUTPUT="max_msg_size=-31699,buffer_read_offset=15106,buffer_bytes_left=30709,";;
    p39) INPUT="0 0 -21205" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-21205,";;
    p38) INPUT="22220 -9538 0" && OUTPUT="max_msg_size=22220,buffer_read_offset=-9538,buffer_bytes_left=0,";;
    p37) INPUT="-18627 8741 -4733" && OUTPUT="max_msg_size=-18627,buffer_read_offset=8741,buffer_bytes_left=-4733,";;
    p36) INPUT="0 10398 4389" && OUTPUT="max_msg_size=0,buffer_read_offset=10398,buffer_bytes_left=4389,size=64,";;
    p35) INPUT="32147 0 29564" && OUTPUT="max_msg_size=32147,buffer_read_offset=0,buffer_bytes_left=29564,";;
    p34) INPUT="12470 -18384 0" && OUTPUT="max_msg_size=12470,buffer_read_offset=-18384,buffer_bytes_left=0,";;
    p33) INPUT="28773 -25968 0" && OUTPUT="max_msg_size=28773,buffer_read_offset=-25968,buffer_bytes_left=0,";;
    p32) INPUT="0 -26084 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-26084,buffer_bytes_left=0,";;
    p31) INPUT="-13964 -15010 20069" && OUTPUT="max_msg_size=-13964,buffer_read_offset=-15010,buffer_bytes_left=20069,";;
    p30) INPUT="-30425 0 -29861" && OUTPUT="max_msg_size=-30425,buffer_read_offset=0,buffer_bytes_left=-29861,";;
    p29) INPUT="-18965 -17520 1558" && OUTPUT="max_msg_size=-18965,buffer_read_offset=-17520,buffer_bytes_left=1558,";;
    p28) INPUT="-9678 0 0" && OUTPUT="max_msg_size=-9678,buffer_read_offset=0,buffer_bytes_left=0,";;
    p27) INPUT="-13470 32158 17142" && OUTPUT="max_msg_size=-13470,buffer_read_offset=32158,buffer_bytes_left=17142,";;
    p26) INPUT="0 0 14709" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=14709,";;
    p25) INPUT="0 0 8985" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=8985,";;
    p24) INPUT="30798 0 0" && OUTPUT="max_msg_size=30798,buffer_read_offset=0,buffer_bytes_left=0,";;
    p23) INPUT="0 -1044 18385" && OUTPUT="max_msg_size=0,buffer_read_offset=-1044,buffer_bytes_left=18385,";;
    p22) INPUT="-10744 24173 25449" && OUTPUT="max_msg_size=-10744,buffer_read_offset=24173,buffer_bytes_left=25449,";;
    p21) INPUT="0 1182 20811" && OUTPUT="max_msg_size=0,buffer_read_offset=1182,buffer_bytes_left=20811,size=64,";;
    p20) INPUT="16009 0 0" && OUTPUT="max_msg_size=16009,buffer_read_offset=0,buffer_bytes_left=0,";;
    p19) INPUT="11407 -17637 12813" && OUTPUT="max_msg_size=11407,buffer_read_offset=-17637,buffer_bytes_left=12813,";;
    p18) INPUT="-13859 27551 0" && OUTPUT="max_msg_size=-13859,buffer_read_offset=27551,buffer_bytes_left=0,";;
    p17) INPUT="24236 -29918 -21678" && OUTPUT="max_msg_size=24236,buffer_read_offset=-29918,buffer_bytes_left=-21678,";;
    p16) INPUT="7044 19138 -10611" && OUTPUT="max_msg_size=7044,buffer_read_offset=19138,buffer_bytes_left=-10611,";;
    p15) INPUT="0 -27892 -16689" && OUTPUT="max_msg_size=0,buffer_read_offset=-27892,buffer_bytes_left=-16689,";;
    p14) INPUT="0 0 0" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=0,";;
    p13) INPUT="29023 0 8239" && OUTPUT="max_msg_size=29023,buffer_read_offset=0,buffer_bytes_left=8239,";;
    p12) INPUT="10392 0 0" && OUTPUT="max_msg_size=10392,buffer_read_offset=0,buffer_bytes_left=0,";;
    p11) INPUT="17335 0 -31263" && OUTPUT="max_msg_size=17335,buffer_read_offset=0,buffer_bytes_left=-31263,";;
    p10) INPUT="17819 0 -25571" && OUTPUT="max_msg_size=17819,buffer_read_offset=0,buffer_bytes_left=-25571,";;
    p9) INPUT="26749 9204 10718" && OUTPUT="max_msg_size=26749,buffer_read_offset=9204,buffer_bytes_left=10718,size=64,";;
    p8) INPUT="0 -24599 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-24599,buffer_bytes_left=0,";;
    p7) INPUT="0 -4626 0" && OUTPUT="max_msg_size=0,buffer_read_offset=-4626,buffer_bytes_left=0,";;
    p6) INPUT="0 18300 -8421" && OUTPUT="max_msg_size=0,buffer_read_offset=18300,buffer_bytes_left=-8421,";;
    p5) INPUT="26163 11180 10968" && OUTPUT="max_msg_size=26163,buffer_read_offset=11180,buffer_bytes_left=10968,size=64,";;
    p4) INPUT="0 0 -438" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-438,";;
    p3) INPUT="0 -22914 -25288" && OUTPUT="max_msg_size=0,buffer_read_offset=-22914,buffer_bytes_left=-25288,";;
    p2) INPUT="15117 26690 27124" && OUTPUT="max_msg_size=15117,buffer_read_offset=26690,buffer_bytes_left=27124,size=64,";;
    p1) INPUT="0 0 -482" && OUTPUT="max_msg_size=0,buffer_read_offset=0,buffer_bytes_left=-482,";;

    # Negative test cases:
    n16) INPUT="0 25670 0" && OUTPUT="max_msg_size=0,buffer_read_offset=25670,buffer_bytes_left=0,size=0,";;
    n15) INPUT="0 23033 0" && OUTPUT="max_msg_size=0,buffer_read_offset=23033,buffer_bytes_left=0,size=0,";;
    n14) INPUT="0 13870 0" && OUTPUT="max_msg_size=0,buffer_read_offset=13870,buffer_bytes_left=0,size=0,";;
    n13) INPUT="20600 2160 0" && OUTPUT="max_msg_size=20600,buffer_read_offset=2160,buffer_bytes_left=128,size=128,";;
    n12) INPUT="10342 28489 0" && OUTPUT="max_msg_size=10342,buffer_read_offset=28489,buffer_bytes_left=128,size=128,";;
    n11) INPUT="0 24074 0" && OUTPUT="max_msg_size=0,buffer_read_offset=24074,buffer_bytes_left=0,size=0,";;
    n10) INPUT="379 5686 0" && OUTPUT="max_msg_size=379,buffer_read_offset=5686,buffer_bytes_left=128,size=128,";;
    n9) INPUT="0 12982 0" && OUTPUT="max_msg_size=0,buffer_read_offset=12982,buffer_bytes_left=0,size=0,";;
    n8) INPUT="0 22572 0" && OUTPUT="max_msg_size=0,buffer_read_offset=22572,buffer_bytes_left=0,size=0,";;
    n7) INPUT="0 28132 0" && OUTPUT="max_msg_size=0,buffer_read_offset=28132,buffer_bytes_left=0,size=0,";;
    n6) INPUT="0 1983 0" && OUTPUT="max_msg_size=0,buffer_read_offset=1983,buffer_bytes_left=0,size=0,";;
    n5) INPUT="0 31935 0" && OUTPUT="max_msg_size=0,buffer_read_offset=31935,buffer_bytes_left=0,size=0,";;
    n4) INPUT="0 11172 0" && OUTPUT="max_msg_size=0,buffer_read_offset=11172,buffer_bytes_left=0,size=0,";;
    n3) INPUT="2825 31835 0" && OUTPUT="max_msg_size=2825,buffer_read_offset=31835,buffer_bytes_left=128,size=128,";;
    n2) INPUT="27357 22698 0" && OUTPUT="max_msg_size=27357,buffer_read_offset=22698,buffer_bytes_left=128,size=128,";;
    n1) INPUT="64 64 0" && OUTPUT="";;

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
