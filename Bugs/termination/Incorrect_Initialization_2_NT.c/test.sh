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

BREAKLINE=63
INTERESTING_VARIABLES=( matroska res )
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
    n163) INPUT="0 27404 -14455" && OUTPUT="matroska=1,res=-1,";;
    n162) INPUT="17835 0 -13923" && OUTPUT="matroska=1,res=-1,";;
    n161) INPUT="-24031 0 -15427" && OUTPUT="matroska=1,res=-1,";;
    n160) INPUT="-24758 2517 -4242" && OUTPUT="matroska=1,res=-1,";;
    n159) INPUT="-32627 0 -6499" && OUTPUT="matroska=1,res=-1,";;
    n158) INPUT="0 0 18489" && OUTPUT="matroska=1,res=-1,";;
    n157) INPUT="-10072 30176 22124" && OUTPUT="matroska=1,res=-1,";;
    n156) INPUT="8032 -16852 0" && OUTPUT="matroska=1,res=-1,";;
    n155) INPUT="0 0 -26004" && OUTPUT="matroska=1,res=-1,";;
    n154) INPUT="-5849 30436 22660" && OUTPUT="matroska=1,res=-1,";;
    n153) INPUT="12877 27312 -2758" && OUTPUT="matroska=1,res=-1,";;
    n152) INPUT="1159 -18290 14760" && OUTPUT="matroska=1,res=-1,";;
    n151) INPUT="-18729 -28753 0" && OUTPUT="matroska=1,res=-1,";;
    n150) INPUT="0 25842 -4809" && OUTPUT="matroska=1,res=-1,";;
    n149) INPUT="0 1389 -19588" && OUTPUT="matroska=1,res=-1,";;
    n148) INPUT="0 25234 -16274" && OUTPUT="matroska=1,res=-1,";;
    n147) INPUT="0 25670 0" && OUTPUT="matroska=1,res=-1,";;
    n146) INPUT="-32504 21271 2462" && OUTPUT="matroska=1,res=-1,";;
    n145) INPUT="0 -10757 7855" && OUTPUT="matroska=1,res=-1,";;
    n144) INPUT="4884 0 0" && OUTPUT="matroska=1,res=-1,";;
    n143) INPUT="-27215 -28848 -18754" && OUTPUT="matroska=1,res=-1,";;
    n142) INPUT="-6158 -8982 21087" && OUTPUT="matroska=1,res=-1,";;
    n141) INPUT="12544 -26555 29648" && OUTPUT="matroska=1,res=-1,";;
    n140) INPUT="31850 0 -28445" && OUTPUT="matroska=1,res=-1,";;
    n139) INPUT="-9811 16662 -22896" && OUTPUT="matroska=1,res=-1,";;
    n138) INPUT="0 23033 0" && OUTPUT="matroska=1,res=-1,";;
    n137) INPUT="-14591 0 0" && OUTPUT="matroska=1,res=-1,";;
    n136) INPUT="14901 -13874 -17607" && OUTPUT="matroska=1,res=-1,";;
    n135) INPUT="-15342 17498 1074" && OUTPUT="matroska=1,res=-1,";;
    n134) INPUT="0 -15953 -26626" && OUTPUT="matroska=1,res=-1,";;
    n133) INPUT="14695 0 0" && OUTPUT="matroska=1,res=-1,";;
    n132) INPUT="0 30035 -25797" && OUTPUT="matroska=1,res=-1,";;
    n131) INPUT="-4117 -26497 0" && OUTPUT="matroska=1,res=-1,";;
    n130) INPUT="0 -19509 0" && OUTPUT="matroska=1,res=-1,";;
    n129) INPUT="1324 0 -24134" && OUTPUT="matroska=1,res=-1,";;
    n128) INPUT="8616 -7844 24192" && OUTPUT="matroska=1,res=-1,";;
    n127) INPUT="11183 -17425 0" && OUTPUT="matroska=1,res=-1,";;
    n126) INPUT="7673 14858 -10170" && OUTPUT="matroska=1,res=-1,";;
    n125) INPUT="10440 -2354 6262" && OUTPUT="matroska=1,res=-1,";;
    n124) INPUT="-267 0 24341" && OUTPUT="matroska=1,res=-1,";;
    n123) INPUT="11236 -16537 0" && OUTPUT="matroska=1,res=-1,";;
    n122) INPUT="0 13870 0" && OUTPUT="matroska=1,res=-1,";;
    n121) INPUT="0 0 23119" && OUTPUT="matroska=1,res=-1,";;
    n120) INPUT="20600 2160 0" && OUTPUT="matroska=1,res=-1,";;
    n119) INPUT="-19201 18061 17628" && OUTPUT="matroska=1,res=-1,";;
    n118) INPUT="18903 0 11905" && OUTPUT="matroska=1,res=-1,";;
    n117) INPUT="22221 0 24708" && OUTPUT="matroska=1,res=-1,";;
    n116) INPUT="0 -6305 19389" && OUTPUT="matroska=1,res=-1,";;
    n115) INPUT="31270 -14755 0" && OUTPUT="matroska=1,res=-1,";;
    n114) INPUT="30923 0 256" && OUTPUT="matroska=1,res=-1,";;
    n113) INPUT="-2295 0 28371" && OUTPUT="matroska=1,res=-1,";;
    n112) INPUT="22713 4383 -29729" && OUTPUT="matroska=1,res=-1,";;
    n111) INPUT="0 0 -3499" && OUTPUT="matroska=1,res=-1,";;
    n110) INPUT="10342 28489 0" && OUTPUT="matroska=1,res=-1,";;
    n109) INPUT="15554 -30259 31744" && OUTPUT="matroska=1,res=-1,";;
    n108) INPUT="-7345 0 80" && OUTPUT="matroska=1,res=-1,";;
    n107) INPUT="0 24074 0" && OUTPUT="matroska=1,res=-1,";;
    n106) INPUT="-1324 0 0" && OUTPUT="matroska=1,res=-1,";;
    n105) INPUT="379 5686 0" && OUTPUT="matroska=1,res=-1,";;
    n104) INPUT="0 12982 0" && OUTPUT="matroska=1,res=-1,";;
    n103) INPUT="0 22572 0" && OUTPUT="matroska=1,res=-1,";;
    n102) INPUT="0 -22920 0" && OUTPUT="matroska=1,res=-1,";;
    n101) INPUT="-11541 0 -30145" && OUTPUT="matroska=1,res=-1,";;
    n100) INPUT="0 28132 0" && OUTPUT="matroska=1,res=-1,";;
    n99) INPUT="-1352 12347 15670" && OUTPUT="matroska=1,res=-1,";;
    n98) INPUT="-25909 30414 -11571" && OUTPUT="matroska=1,res=-1,";;
    n97) INPUT="12180 0 13882" && OUTPUT="matroska=1,res=-1,";;
    n96) INPUT="17768 0 0" && OUTPUT="matroska=1,res=-1,";;
    n95) INPUT="9411 22238 -23501" && OUTPUT="matroska=1,res=-1,";;
    n94) INPUT="22896 -2508 0" && OUTPUT="matroska=1,res=-1,";;
    n93) INPUT="28718 13197 -20857" && OUTPUT="matroska=1,res=-1,";;
    n92) INPUT="0 0 10268" && OUTPUT="matroska=1,res=-1,";;
    n91) INPUT="-23891 25355 0" && OUTPUT="matroska=1,res=-1,";;
    n90) INPUT="-25238 18047 0" && OUTPUT="matroska=1,res=-1,";;
    n89) INPUT="18226 -8937 21726" && OUTPUT="matroska=1,res=-1,";;
    n88) INPUT="-6246 -23410 12985" && OUTPUT="matroska=1,res=-1,";;
    n87) INPUT="0 10998 -19412" && OUTPUT="matroska=1,res=-1,";;
    n86) INPUT="0 22728 -20430" && OUTPUT="matroska=1,res=-1,";;
    n85) INPUT="0 -30018 28462" && OUTPUT="matroska=1,res=-1,";;
    n84) INPUT="-24707 -22955 0" && OUTPUT="matroska=1,res=-1,";;
    n83) INPUT="13299 -6475 0" && OUTPUT="matroska=1,res=-1,";;
    n82) INPUT="0 1983 0" && OUTPUT="matroska=1,res=-1,";;
    n81) INPUT="21797 -27422 28682" && OUTPUT="matroska=1,res=-1,";;
    n80) INPUT="-30257 0 5384" && OUTPUT="matroska=1,res=-1,";;
    n79) INPUT="0 31935 0" && OUTPUT="matroska=1,res=-1,";;
    n78) INPUT="0 11172 0" && OUTPUT="matroska=1,res=-1,";;
    n77) INPUT="-11862 26121 -22620" && OUTPUT="matroska=1,res=-1,";;
    n76) INPUT="24828 -1435 -29380" && OUTPUT="matroska=1,res=-1,";;
    n75) INPUT="26672 0 8892" && OUTPUT="matroska=1,res=-1,";;
    n74) INPUT="22332 0 -31346" && OUTPUT="matroska=1,res=-1,";;
    n73) INPUT="0 2292 30841" && OUTPUT="matroska=1,res=-1,";;
    n72) INPUT="-11302 133 21808" && OUTPUT="matroska=1,res=-1,";;
    n71) INPUT="13940 0 -3360" && OUTPUT="matroska=1,res=-1,";;
    n70) INPUT="0 -26169 30807" && OUTPUT="matroska=1,res=-1,";;
    n69) INPUT="-13337 -30702 -4450" && OUTPUT="matroska=1,res=-1,";;
    n68) INPUT="0 0 -17584" && OUTPUT="matroska=1,res=-1,";;
    n67) INPUT="9825 -15074 0" && OUTPUT="matroska=1,res=-1,";;
    n66) INPUT="0 6564 18491" && OUTPUT="matroska=1,res=-1,";;
    n65) INPUT="-14537 13629 20733" && OUTPUT="matroska=1,res=-1,";;
    n64) INPUT="-16845 31231 0" && OUTPUT="matroska=1,res=-1,";;
    n63) INPUT="26871 -23193 0" && OUTPUT="matroska=1,res=-1,";;
    n62) INPUT="9184 0 822" && OUTPUT="matroska=1,res=-1,";;
    n61) INPUT="-10458 -28155 0" && OUTPUT="matroska=1,res=-1,";;
    n60) INPUT="-7343 0 0" && OUTPUT="matroska=1,res=-1,";;
    n59) INPUT="983 0 9194" && OUTPUT="matroska=1,res=-1,";;
    n58) INPUT="0 -28204 0" && OUTPUT="matroska=1,res=-1,";;
    n57) INPUT="0 -1526 6592" && OUTPUT="matroska=1,res=-1,";;
    n56) INPUT="-11017 31473 -26859" && OUTPUT="matroska=1,res=-1,";;
    n55) INPUT="0 32018 14360" && OUTPUT="matroska=1,res=-1,";;
    n54) INPUT="10058 -9462 24996" && OUTPUT="matroska=1,res=-1,";;
    n53) INPUT="-32262 0 -30119" && OUTPUT="matroska=1,res=-1,";;
    n52) INPUT="0 -15399 22212" && OUTPUT="matroska=1,res=-1,";;
    n51) INPUT="15143 0 0" && OUTPUT="matroska=1,res=-1,";;
    n50) INPUT="2825 31835 0" && OUTPUT="matroska=1,res=-1,";;
    n49) INPUT="0 -22529 -27735" && OUTPUT="matroska=1,res=-1,";;
    n48) INPUT="-8698 -26597 0" && OUTPUT="matroska=1,res=-1,";;
    n47) INPUT="0 0 -19180" && OUTPUT="matroska=1,res=-1,";;
    n46) INPUT="0 0 -367" && OUTPUT="matroska=1,res=-1,";;
    n45) INPUT="0 0 -16663" && OUTPUT="matroska=1,res=-1,";;
    n44) INPUT="16076 0 0" && OUTPUT="matroska=1,res=-1,";;
    n43) INPUT="0 7789 12121" && OUTPUT="matroska=1,res=-1,";;
    n42) INPUT="-31699 15106 30709" && OUTPUT="matroska=1,res=-1,";;
    n41) INPUT="0 0 -21205" && OUTPUT="matroska=1,res=-1,";;
    n40) INPUT="22220 -9538 0" && OUTPUT="matroska=1,res=-1,";;
    n39) INPUT="-18627 8741 -4733" && OUTPUT="matroska=1,res=-1,";;
    n38) INPUT="0 10398 4389" && OUTPUT="matroska=1,res=-1,";;
    n37) INPUT="32147 0 29564" && OUTPUT="matroska=1,res=-1,";;
    n36) INPUT="12470 -18384 0" && OUTPUT="matroska=1,res=-1,";;
    n35) INPUT="28773 -25968 0" && OUTPUT="matroska=1,res=-1,";;
    n34) INPUT="0 -26084 0" && OUTPUT="matroska=1,res=-1,";;
    n33) INPUT="-13964 -15010 20069" && OUTPUT="matroska=1,res=-1,";;
    n32) INPUT="-30425 0 -29861" && OUTPUT="matroska=1,res=-1,";;
    n31) INPUT="-18965 -17520 1558" && OUTPUT="matroska=1,res=-1,";;
    n30) INPUT="-9678 0 0" && OUTPUT="matroska=1,res=-1,";;
    n29) INPUT="-13470 32158 17142" && OUTPUT="matroska=1,res=-1,";;
    n28) INPUT="0 0 14709" && OUTPUT="matroska=1,res=-1,";;
    n27) INPUT="0 0 8985" && OUTPUT="matroska=1,res=-1,";;
    n26) INPUT="30798 0 0" && OUTPUT="matroska=1,res=-1,";;
    n25) INPUT="0 -1044 18385" && OUTPUT="matroska=1,res=-1,";;
    n24) INPUT="-10744 24173 25449" && OUTPUT="matroska=1,res=-1,";;
    n23) INPUT="0 1182 20811" && OUTPUT="matroska=1,res=-1,";;
    n22) INPUT="16009 0 0" && OUTPUT="matroska=1,res=-1,";;
    n21) INPUT="11407 -17637 12813" && OUTPUT="matroska=1,res=-1,";;
    n20) INPUT="-13859 27551 0" && OUTPUT="matroska=1,res=-1,";;
    n19) INPUT="27357 22698 0" && OUTPUT="matroska=1,res=-1,";;
    n18) INPUT="24236 -29918 -21678" && OUTPUT="matroska=1,res=-1,";;
    n17) INPUT="7044 19138 -10611" && OUTPUT="matroska=1,res=-1,";;
    n16) INPUT="0 -27892 -16689" && OUTPUT="matroska=1,res=-1,";;
    n15) INPUT="0 0 0" && OUTPUT="matroska=1,res=-1,";;
    n14) INPUT="29023 0 8239" && OUTPUT="matroska=1,res=-1,";;
    n13) INPUT="10392 0 0" && OUTPUT="matroska=1,res=-1,";;
    n12) INPUT="17335 0 -31263" && OUTPUT="matroska=1,res=-1,";;
    n11) INPUT="17819 0 -25571" && OUTPUT="matroska=1,res=-1,";;
    n10) INPUT="26749 9204 10718" && OUTPUT="matroska=1,res=-1,";;
    n9) INPUT="0 -24599 0" && OUTPUT="matroska=1,res=-1,";;
    n8) INPUT="0 -4626 0" && OUTPUT="matroska=1,res=-1,";;
    n7) INPUT="0 18300 -8421" && OUTPUT="matroska=1,res=-1,";;
    n6) INPUT="26163 11180 10968" && OUTPUT="matroska=1,res=-1,";;
    n5) INPUT="0 0 -438" && OUTPUT="matroska=1,res=-1,";;
    n4) INPUT="0 -22914 -25288" && OUTPUT="matroska=1,res=-1,";;
    n3) INPUT="15117 26690 27124" && OUTPUT="matroska=1,res=-1,";;
    n2) INPUT="0 0 -482" && OUTPUT="matroska=1,res=-1,";;
    n1) INPUT="  " && OUTPUT="";;

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
