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

BREAKLINE=39
INTERESTING_VARIABLES=( x mat_colSize y z mat_rowSize )
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
    p350) INPUT="0 0 -7823 9177 0" && OUTPUT="x=0,mat_colSize=0,y=-7823,z=9177,";;
    p349) INPUT="-22494 -14258 15530 0 29979" && OUTPUT="x=-22494,mat_colSize=-14258,y=15530,z=0,mat_rowSize=29979,";;
    p348) INPUT="19399 0 10835 0 0" && OUTPUT="x=0,mat_colSize=0,y=10835,z=0,";;
    p347) INPUT="0 -10972 8482 0 23037" && OUTPUT="x=0,mat_colSize=-10972,y=8482,z=0,mat_rowSize=23037,";;
    p346) INPUT="14236 -29580 13005 0 0" && OUTPUT="x=14236,mat_colSize=-29580,y=13005,z=0,";;
    p345) INPUT="-18137 -7344 -12738 -15512 0" && OUTPUT="x=-18137,mat_colSize=-7344,y=-12738,z=-15512,";;
    p344) INPUT="0 0 0 0 -32677" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=-32677,";;
    p343) INPUT="0 0 0 7223 -24177" && OUTPUT="x=0,mat_colSize=0,y=0,z=7223,mat_rowSize=-24177,";;
    p342) INPUT="-26268 0 9425 31105 0" && OUTPUT="x=0,mat_colSize=0,y=9425,z=31105,";;
    p341) INPUT="0 28765 20753 0 -14103" && OUTPUT="x=0,mat_colSize=28765,y=20753,z=0,mat_rowSize=-14103,";;
    p340) INPUT="0 -7397 -21085 17865 0" && OUTPUT="x=0,mat_colSize=-7397,y=-21085,z=17865,";;
    p339) INPUT="0 20719 441 0 -16712" && OUTPUT="x=0,mat_colSize=20719,y=441,z=0,mat_rowSize=-16712,";;
    p338) INPUT="23789 -23725 0 -4225 14868" && OUTPUT="x=23789,mat_colSize=-23725,y=0,z=-4225,mat_rowSize=14868,";;
    p337) INPUT="-12858 -3341 22245 0 -4571" && OUTPUT="x=-12858,mat_colSize=-3341,y=22245,z=0,mat_rowSize=-4571,";;
    p336) INPUT="0 0 -325 -26862 -23765" && OUTPUT="x=0,mat_colSize=0,y=-325,z=-26862,mat_rowSize=-23765,";;
    p335) INPUT="0 -32319 4645 -10582 29596" && OUTPUT="x=0,mat_colSize=-32319,y=4645,z=-10582,mat_rowSize=29596,";;
    p334) INPUT="-2272 -19867 17253 4641 0" && OUTPUT="x=-2272,mat_colSize=-19867,y=17253,z=4641,";;
    p333) INPUT="0 0 5485 0 12940" && OUTPUT="x=0,mat_colSize=0,y=5485,z=0,mat_rowSize=12940,";;
    p332) INPUT="-7491 5513 -15360 -28088 -10341" && OUTPUT="x=-7491,mat_colSize=5513,y=-15360,z=-28088,mat_rowSize=-10341,";;
    p331) INPUT="0 -9727 -728 26252 -25135" && OUTPUT="x=0,mat_colSize=-9727,y=-728,z=26252,mat_rowSize=-25135,";;
    p330) INPUT="3779 -27997 19503 31372 0" && OUTPUT="x=3779,mat_colSize=-27997,y=19503,z=31372,";;
    p329) INPUT="23723 26353 30131 0 -15738" && OUTPUT="x=23723,mat_colSize=26353,y=30131,z=0,mat_rowSize=-15738,";;
    p328) INPUT="13729 0 27524 0 -11344" && OUTPUT="x=13729,mat_colSize=0,y=27524,z=0,mat_rowSize=-11344,";;
    p327) INPUT="28869 -26487 31231 20875 0" && OUTPUT="x=28869,mat_colSize=-26487,y=31231,z=20875,";;
    p326) INPUT="10713 -12363 29816 0 7861" && OUTPUT="x=10713,mat_colSize=-12363,y=29816,z=0,mat_rowSize=7861,";;
    p325) INPUT="18490 -12470 0 10866 -29910" && OUTPUT="x=18490,mat_colSize=-12470,y=0,z=10866,mat_rowSize=-29910,";;
    p324) INPUT="0 0 0 3324 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=3324,";;
    p323) INPUT="-23289 0 9248 -10911 -29415" && OUTPUT="x=-23289,mat_colSize=0,y=9248,z=-10911,mat_rowSize=-29415,";;
    p322) INPUT="20774 0 11506 0 0" && OUTPUT="x=0,mat_colSize=0,y=11506,z=0,";;
    p321) INPUT="-12759 0 -10293 -14460 0" && OUTPUT="x=0,mat_colSize=0,y=-10293,z=-14460,";;
    p320) INPUT="-8028 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p319) INPUT="5463 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p318) INPUT="-27374 -5842 11379 -10642 2260" && OUTPUT="x=-27374,mat_colSize=-5842,y=11379,z=-10642,mat_rowSize=2260,";;
    p317) INPUT="27092 -29652 695 0 -26090" && OUTPUT="x=27092,mat_colSize=-29652,y=695,z=0,mat_rowSize=-26090,";;
    p316) INPUT="-13728 0 7212 0 0" && OUTPUT="x=0,mat_colSize=0,y=7212,z=0,";;
    p315) INPUT="0 8206 -23997 -25586 -27980" && OUTPUT="x=0,mat_colSize=8206,y=-23997,z=-25586,mat_rowSize=-27980,";;
    p314) INPUT="0 0 0 -22236 15031" && OUTPUT="x=0,mat_colSize=0,y=0,z=-22236,mat_rowSize=15031,";;
    p313) INPUT="0 0 0 -22305 26448" && OUTPUT="x=0,mat_colSize=0,y=0,z=-22305,mat_rowSize=26448,";;
    p312) INPUT="2482 -20242 0 16538 29223" && OUTPUT="x=2482,mat_colSize=-20242,y=0,z=16538,mat_rowSize=29223,";;
    p311) INPUT="0 0 16004 -5789 4739" && OUTPUT="x=0,mat_colSize=0,y=16004,z=-5789,mat_rowSize=4739,";;
    p310) INPUT="-21343 -25631 9178 21531 -29419" && OUTPUT="x=-21343,mat_colSize=-25631,y=9178,z=21531,mat_rowSize=-29419,";;
    p309) INPUT="0 0 0 0 9189" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=9189,";;
    p308) INPUT="17691 0 24728 20845 -30238" && OUTPUT="x=17691,mat_colSize=0,y=24728,z=20845,mat_rowSize=-30238,";;
    p307) INPUT="13428 0 -12265 25934 0" && OUTPUT="x=0,mat_colSize=0,y=-12265,z=25934,";;
    p306) INPUT="0 0 0 18132 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=18132,";;
    p305) INPUT="4099 0 -2806 -29874 0" && OUTPUT="x=0,mat_colSize=0,y=-2806,z=-29874,";;
    p304) INPUT="0 0 -10792 -14730 0" && OUTPUT="x=0,mat_colSize=0,y=-10792,z=-14730,";;
    p303) INPUT="-26482 0 194 0 8118" && OUTPUT="x=0,mat_colSize=0,y=194,z=0,mat_rowSize=8118,";;
    p302) INPUT="6035 -18382 -23673 -19421 1344" && OUTPUT="x=6035,mat_colSize=-18382,y=-23673,z=-19421,mat_rowSize=1344,";;
    p301) INPUT="-26884 0 0 0 10084" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=10084,";;
    p300) INPUT="15245 21793 12287 0 -11697" && OUTPUT="x=15245,mat_colSize=21793,y=12287,z=0,mat_rowSize=-11697,";;
    p299) INPUT="0 0 -27086 0 -26644" && OUTPUT="x=0,mat_colSize=0,y=-27086,z=0,mat_rowSize=-26644,";;
    p298) INPUT="32388 8753 -7136 -6658 -7472" && OUTPUT="x=32388,mat_colSize=8753,y=-7136,z=-6658,mat_rowSize=-7472,";;
    p297) INPUT="-22607 0 0 0 -10650" && OUTPUT="x=-22607,mat_colSize=0,y=0,z=0,mat_rowSize=-10650,";;
    p296) INPUT="-12205 -2635 24182 -24170 0" && OUTPUT="x=-12205,mat_colSize=-2635,y=24182,z=-24170,";;
    p295) INPUT="-31761 -23862 -32453 -5050 -25677" && OUTPUT="x=-31761,mat_colSize=-23862,y=-32453,z=-5050,mat_rowSize=-25677,";;
    p294) INPUT="2223 -16247 0 -18386 -22969" && OUTPUT="x=2223,mat_colSize=-16247,y=0,z=-18386,mat_rowSize=-22969,";;
    p293) INPUT="0 0 -17064 0 0" && OUTPUT="x=0,mat_colSize=0,y=-17064,z=0,";;
    p292) INPUT="0 -17083 24184 12714 -26529" && OUTPUT="x=0,mat_colSize=-17083,y=24184,z=12714,mat_rowSize=-26529,";;
    p291) INPUT="-26045 0 -3019 19485 -128" && OUTPUT="x=-26045,mat_colSize=0,y=-3019,z=19485,mat_rowSize=-128,";;
    p290) INPUT="0 8104 -23306 0 -7590" && OUTPUT="x=0,mat_colSize=8104,y=-23306,z=0,mat_rowSize=-7590,";;
    p289) INPUT="18350 21707 0 -20513 -8777" && OUTPUT="x=18350,mat_colSize=21707,y=0,z=-20513,mat_rowSize=-8777,";;
    p288) INPUT="-16743 0 9706 0 -11579" && OUTPUT="x=-16743,mat_colSize=0,y=9706,z=0,mat_rowSize=-11579,";;
    p287) INPUT="17541 0 0 -4822 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=-4822,";;
    p286) INPUT="-19321 0 -20233 17374 31369" && OUTPUT="x=0,mat_colSize=0,y=-20233,z=17374,mat_rowSize=31369,";;
    p285) INPUT="-3640 2329 0 0 -23458" && OUTPUT="x=-3640,mat_colSize=2329,y=0,z=0,mat_rowSize=-23458,";;
    p284) INPUT="0 -18990 28480 0 0" && OUTPUT="x=0,mat_colSize=-18990,y=28480,z=0,";;
    p283) INPUT="0 26292 -17993 0 -22383" && OUTPUT="x=0,mat_colSize=26292,y=-17993,z=0,mat_rowSize=-22383,";;
    p282) INPUT="18903 0 -15253 0 69" && OUTPUT="x=0,mat_colSize=0,y=-15253,z=0,mat_rowSize=69,";;
    p281) INPUT="11290 0 21759 18087 0" && OUTPUT="x=0,mat_colSize=0,y=21759,z=18087,";;
    p280) INPUT="-5680 0 0 15402 -4110" && OUTPUT="x=-5680,mat_colSize=0,y=0,z=15402,mat_rowSize=-4110,";;
    p279) INPUT="0 -20229 -6831 -1728 0" && OUTPUT="x=0,mat_colSize=-20229,y=-6831,z=-1728,";;
    p278) INPUT="0 -895 17023 -3575 0" && OUTPUT="x=0,mat_colSize=-895,y=17023,z=-3575,";;
    p277) INPUT="0 0 -15835 21911 0" && OUTPUT="x=0,mat_colSize=0,y=-15835,z=21911,";;
    p276) INPUT="3384 0 32152 0 27292" && OUTPUT="x=0,mat_colSize=0,y=32152,z=0,mat_rowSize=27292,";;
    p275) INPUT="-11042 -22293 0 0 -8744" && OUTPUT="x=-11042,mat_colSize=-22293,y=0,z=0,mat_rowSize=-8744,";;
    p274) INPUT="0 0 7944 0 0" && OUTPUT="x=0,mat_colSize=0,y=7944,z=0,";;
    p273) INPUT="21300 0 16423 -1690 0" && OUTPUT="x=0,mat_colSize=0,y=16423,z=-1690,";;
    p272) INPUT="-13536 0 6701 0 12682" && OUTPUT="x=0,mat_colSize=0,y=6701,z=0,mat_rowSize=12682,";;
    p271) INPUT="0 -5213 -4830 0 -9856" && OUTPUT="x=0,mat_colSize=-5213,y=-4830,z=0,mat_rowSize=-9856,";;
    p270) INPUT="-8143 -27145 0 6073 0" && OUTPUT="x=-8143,mat_colSize=-27145,y=0,z=6073,";;
    p269) INPUT="1316 -8358 -31482 -20978 7367" && OUTPUT="x=1316,mat_colSize=-8358,y=-31482,z=-20978,mat_rowSize=7367,";;
    p268) INPUT="30185 0 -15850 6237 0" && OUTPUT="x=0,mat_colSize=0,y=-15850,z=6237,";;
    p267) INPUT="30141 -8787 -23232 0 -23928" && OUTPUT="x=30141,mat_colSize=-8787,y=-23232,z=0,mat_rowSize=-23928,";;
    p266) INPUT="31645 0 -25882 10537 -26481" && OUTPUT="x=31645,mat_colSize=0,y=-25882,z=10537,mat_rowSize=-26481,";;
    p265) INPUT="29006 -6218 -3384 21744 1822" && OUTPUT="x=29006,mat_colSize=-6218,y=-3384,z=21744,mat_rowSize=1822,";;
    p264) INPUT="26993 0 -30941 17699 -19779" && OUTPUT="x=26993,mat_colSize=0,y=-30941,z=17699,mat_rowSize=-19779,";;
    p263) INPUT="0 11534 -19487 0 -16224" && OUTPUT="x=0,mat_colSize=11534,y=-19487,z=0,mat_rowSize=-16224,";;
    p262) INPUT="21666 -23122 8185 -13500 0" && OUTPUT="x=21666,mat_colSize=-23122,y=8185,z=-13500,";;
    p261) INPUT="645 -5967 0 0 -13080" && OUTPUT="x=645,mat_colSize=-5967,y=0,z=0,mat_rowSize=-13080,";;
    p260) INPUT="-660 -27083 1742 0 27137" && OUTPUT="x=-660,mat_colSize=-27083,y=1742,z=0,mat_rowSize=27137,";;
    p259) INPUT="14446 12264 -12778 10981 -17532" && OUTPUT="x=14446,mat_colSize=12264,y=-12778,z=10981,mat_rowSize=-17532,";;
    p258) INPUT="-20232 -6186 17414 13766 0" && OUTPUT="x=-20232,mat_colSize=-6186,y=17414,z=13766,";;
    p257) INPUT="-5261 -3788 0 -13668 27664" && OUTPUT="x=-5261,mat_colSize=-3788,y=0,z=-13668,mat_rowSize=27664,";;
    p256) INPUT="-2955 -25022 -17256 21146 -10211" && OUTPUT="x=-2955,mat_colSize=-25022,y=-17256,z=21146,mat_rowSize=-10211,";;
    p255) INPUT="8548 -21710 2188 0 -13268" && OUTPUT="x=8548,mat_colSize=-21710,y=2188,z=0,mat_rowSize=-13268,";;
    p254) INPUT="-16080 -164 11735 -825 9820" && OUTPUT="x=-16080,mat_colSize=-164,y=11735,z=-825,mat_rowSize=9820,";;
    p253) INPUT="6614 -19774 3132 -26851 -19175" && OUTPUT="x=6614,mat_colSize=-19774,y=3132,z=-26851,mat_rowSize=-19175,";;
    p252) INPUT="18570 -8872 -27747 24439 0" && OUTPUT="x=18570,mat_colSize=-8872,y=-27747,z=24439,";;
    p251) INPUT="23728 -2519 -10211 -15366 5474" && OUTPUT="x=23728,mat_colSize=-2519,y=-10211,z=-15366,mat_rowSize=5474,";;
    p250) INPUT="5922 21940 28606 0 -5584" && OUTPUT="x=5922,mat_colSize=21940,y=28606,z=0,mat_rowSize=-5584,";;
    p249) INPUT="-19346 0 -23367 0 -19573" && OUTPUT="x=-19346,mat_colSize=0,y=-23367,z=0,mat_rowSize=-19573,";;
    p248) INPUT="11462 0 2343 12074 15145" && OUTPUT="x=0,mat_colSize=0,y=2343,z=12074,mat_rowSize=15145,";;
    p247) INPUT="16143 31244 0 -19240 -32157" && OUTPUT="x=16143,mat_colSize=31244,y=0,z=-19240,mat_rowSize=-32157,";;
    p246) INPUT="0 0 0 -25707 14562" && OUTPUT="x=0,mat_colSize=0,y=0,z=-25707,mat_rowSize=14562,";;
    p245) INPUT="0 -6919 0 -23222 19690" && OUTPUT="x=0,mat_colSize=-6919,y=0,z=-23222,mat_rowSize=19690,";;
    p244) INPUT="21229 0 22454 -511 -20157" && OUTPUT="x=21229,mat_colSize=0,y=22454,z=-511,mat_rowSize=-20157,";;
    p243) INPUT="0 26431 10132 2606 -5549" && OUTPUT="x=0,mat_colSize=26431,y=10132,z=2606,mat_rowSize=-5549,";;
    p242) INPUT="0 0 2842 -13417 0" && OUTPUT="x=0,mat_colSize=0,y=2842,z=-13417,";;
    p241) INPUT="-20514 -5783 0 -28781 0" && OUTPUT="x=-20514,mat_colSize=-5783,y=0,z=-28781,";;
    p240) INPUT="-2531 -27193 -17490 -17080 31876" && OUTPUT="x=-2531,mat_colSize=-27193,y=-17490,z=-17080,mat_rowSize=31876,";;
    p239) INPUT="12094 -9860 0 -3333 0" && OUTPUT="x=12094,mat_colSize=-9860,y=0,z=-3333,";;
    p238) INPUT="7172 -4581 -5995 17893 27030" && OUTPUT="x=7172,mat_colSize=-4581,y=-5995,z=17893,mat_rowSize=27030,";;
    p237) INPUT="-22463 -29146 -25316 25577 0" && OUTPUT="x=-22463,mat_colSize=-29146,y=-25316,z=25577,";;
    p236) INPUT="30616 23846 9238 0 -28160" && OUTPUT="x=30616,mat_colSize=23846,y=9238,z=0,mat_rowSize=-28160,";;
    p235) INPUT="0 0 0 -25788 -7711" && OUTPUT="x=0,mat_colSize=0,y=0,z=-25788,mat_rowSize=-7711,";;
    p234) INPUT="31249 -6409 -19853 0 0" && OUTPUT="x=31249,mat_colSize=-6409,y=-19853,z=0,";;
    p233) INPUT="0 -5259 21107 -31278 0" && OUTPUT="x=0,mat_colSize=-5259,y=21107,z=-31278,";;
    p232) INPUT="0 0 0 0 5734" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=5734,";;
    p231) INPUT="0 -1034 9566 0 0" && OUTPUT="x=0,mat_colSize=-1034,y=9566,z=0,";;
    p230) INPUT="5280 0 12672 27990 -24164" && OUTPUT="x=5280,mat_colSize=0,y=12672,z=27990,mat_rowSize=-24164,";;
    p229) INPUT="0 -24091 0 0 24708" && OUTPUT="x=0,mat_colSize=-24091,y=0,z=0,mat_rowSize=24708,";;
    p228) INPUT="30061 7170 21482 26007 -2855" && OUTPUT="x=30061,mat_colSize=7170,y=21482,z=26007,mat_rowSize=-2855,";;
    p227) INPUT="0 0 0 -6422 -12172" && OUTPUT="x=0,mat_colSize=0,y=0,z=-6422,mat_rowSize=-12172,";;
    p226) INPUT="-17476 -7438 -5714 -1435 0" && OUTPUT="x=-17476,mat_colSize=-7438,y=-5714,z=-1435,";;
    p225) INPUT="7109 0 -24384 0 22593" && OUTPUT="x=0,mat_colSize=0,y=-24384,z=0,mat_rowSize=22593,";;
    p224) INPUT="4807 0 -19816 738 17395" && OUTPUT="x=0,mat_colSize=0,y=-19816,z=738,mat_rowSize=17395,";;
    p223) INPUT="-23596 -624 -8031 30408 -25211" && OUTPUT="x=-23596,mat_colSize=-624,y=-8031,z=30408,mat_rowSize=-25211,";;
    p222) INPUT="-20522 0 27405 16804 0" && OUTPUT="x=0,mat_colSize=0,y=27405,z=16804,";;
    p221) INPUT="0 -27646 8945 -12777 0" && OUTPUT="x=0,mat_colSize=-27646,y=8945,z=-12777,";;
    p220) INPUT="-4741 -31631 -4602 0 0" && OUTPUT="x=-4741,mat_colSize=-31631,y=-4602,z=0,";;
    p219) INPUT="0 29096 -25332 9662 -31806" && OUTPUT="x=0,mat_colSize=29096,y=-25332,z=9662,mat_rowSize=-31806,";;
    p218) INPUT="0 19714 0 -3003 -30868" && OUTPUT="x=0,mat_colSize=19714,y=0,z=-3003,mat_rowSize=-30868,";;
    p217) INPUT="-24624 6722 1828 0 -7648" && OUTPUT="x=-24624,mat_colSize=6722,y=1828,z=0,mat_rowSize=-7648,";;
    p216) INPUT="17002 0 0 0 -23427" && OUTPUT="x=17002,mat_colSize=0,y=0,z=0,mat_rowSize=-23427,";;
    p215) INPUT="0 -17757 0 -21546 19492" && OUTPUT="x=0,mat_colSize=-17757,y=0,z=-21546,mat_rowSize=19492,";;
    p214) INPUT="0 -7103 0 0 31185" && OUTPUT="x=0,mat_colSize=-7103,y=0,z=0,mat_rowSize=31185,";;
    p213) INPUT="17566 28402 -10903 0 -21271" && OUTPUT="x=17566,mat_colSize=28402,y=-10903,z=0,mat_rowSize=-21271,";;
    p212) INPUT="10621 -10529 -15451 8379 0" && OUTPUT="x=10621,mat_colSize=-10529,y=-15451,z=8379,";;
    p211) INPUT="0 -20750 -31514 -15534 0" && OUTPUT="x=0,mat_colSize=-20750,y=-31514,z=-15534,";;
    p210) INPUT="-10399 -11221 1069 -24957 -25030" && OUTPUT="x=-10399,mat_colSize=-11221,y=1069,z=-24957,mat_rowSize=-25030,";;
    p209) INPUT="12858 0 -28382 27059 0" && OUTPUT="x=0,mat_colSize=0,y=-28382,z=27059,";;
    p208) INPUT="0 20148 26057 -10014 -3734" && OUTPUT="x=0,mat_colSize=20148,y=26057,z=-10014,mat_rowSize=-3734,";;
    p207) INPUT="0 0 -7377 9924 0" && OUTPUT="x=0,mat_colSize=0,y=-7377,z=9924,";;
    p206) INPUT="20130 0 0 -22911 23027" && OUTPUT="x=0,mat_colSize=0,y=0,z=-22911,mat_rowSize=23027,";;
    p205) INPUT="-18198 0 -25221 0 -29106" && OUTPUT="x=-18198,mat_colSize=0,y=-25221,z=0,mat_rowSize=-29106,";;
    p204) INPUT="-32648 -18088 0 0 15038" && OUTPUT="x=-32648,mat_colSize=-18088,y=0,z=0,mat_rowSize=15038,";;
    p203) INPUT="31392 26539 0 17001 -2288" && OUTPUT="x=31392,mat_colSize=26539,y=0,z=17001,mat_rowSize=-2288,";;
    p202) INPUT="0 0 0 -11104 -2325" && OUTPUT="x=0,mat_colSize=0,y=0,z=-11104,mat_rowSize=-2325,";;
    p201) INPUT="-21857 0 0 3047 -5320" && OUTPUT="x=-21857,mat_colSize=0,y=0,z=3047,mat_rowSize=-5320,";;
    p200) INPUT="0 0 9487 0 0" && OUTPUT="x=0,mat_colSize=0,y=9487,z=0,";;
    p199) INPUT="0 -10957 0 -23719 2827" && OUTPUT="x=0,mat_colSize=-10957,y=0,z=-23719,mat_rowSize=2827,";;
    p198) INPUT="-25818 0 -27767 -31197 0" && OUTPUT="x=0,mat_colSize=0,y=-27767,z=-31197,";;
    p197) INPUT="0 -27027 -20702 -14478 3302" && OUTPUT="x=0,mat_colSize=-27027,y=-20702,z=-14478,mat_rowSize=3302,";;
    p196) INPUT="28260 0 0 28728 -8025" && OUTPUT="x=28260,mat_colSize=0,y=0,z=28728,mat_rowSize=-8025,";;
    p195) INPUT="12368 -10754 0 -4107 8368" && OUTPUT="x=12368,mat_colSize=-10754,y=0,z=-4107,mat_rowSize=8368,";;
    p194) INPUT="0 0 0 24579 28022" && OUTPUT="x=0,mat_colSize=0,y=0,z=24579,mat_rowSize=28022,";;
    p193) INPUT="10559 -6877 0 0 0" && OUTPUT="x=10559,mat_colSize=-6877,y=0,z=0,";;
    p192) INPUT="21110 -19535 0 0 0" && OUTPUT="x=21110,mat_colSize=-19535,y=0,z=0,";;
    p191) INPUT="27813 44 23353 -14761 -20352" && OUTPUT="x=27813,mat_colSize=44,y=23353,z=-14761,mat_rowSize=-20352,";;
    p190) INPUT="15116 0 26246 20465 0" && OUTPUT="x=0,mat_colSize=0,y=26246,z=20465,";;
    p189) INPUT="26095 0 0 -28351 -6724" && OUTPUT="x=26095,mat_colSize=0,y=0,z=-28351,mat_rowSize=-6724,";;
    p188) INPUT="23823 -32170 16994 0 0" && OUTPUT="x=23823,mat_colSize=-32170,y=16994,z=0,";;
    p187) INPUT="7383 -30517 -31984 22216 443" && OUTPUT="x=7383,mat_colSize=-30517,y=-31984,z=22216,mat_rowSize=443,";;
    p186) INPUT="0 -5616 -21786 0 11885" && OUTPUT="x=0,mat_colSize=-5616,y=-21786,z=0,mat_rowSize=11885,";;
    p185) INPUT="7585 -11620 13029 0 -10228" && OUTPUT="x=7585,mat_colSize=-11620,y=13029,z=0,mat_rowSize=-10228,";;
    p184) INPUT="0 -12813 -12259 0 0" && OUTPUT="x=0,mat_colSize=-12813,y=-12259,z=0,";;
    p183) INPUT="7014 -3688 0 -7886 0" && OUTPUT="x=7014,mat_colSize=-3688,y=0,z=-7886,";;
    p182) INPUT="25885 7005 18716 0 -3350" && OUTPUT="x=25885,mat_colSize=7005,y=18716,z=0,mat_rowSize=-3350,";;
    p181) INPUT="-20191 -17701 0 0 0" && OUTPUT="x=-20191,mat_colSize=-17701,y=0,z=0,";;
    p180) INPUT="14843 0 26963 -18064 14659" && OUTPUT="x=0,mat_colSize=0,y=26963,z=-18064,mat_rowSize=14659,";;
    p179) INPUT="-30824 0 -13625 0 0" && OUTPUT="x=0,mat_colSize=0,y=-13625,z=0,";;
    p178) INPUT="-21129 9279 0 31376 -16234" && OUTPUT="x=-21129,mat_colSize=9279,y=0,z=31376,mat_rowSize=-16234,";;
    p177) INPUT="0 -17854 0 16148 9572" && OUTPUT="x=0,mat_colSize=-17854,y=0,z=16148,mat_rowSize=9572,";;
    p176) INPUT="-21236 0 0 0 30385" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=30385,";;
    p175) INPUT="-16198 -31936 0 -7117 0" && OUTPUT="x=-16198,mat_colSize=-31936,y=0,z=-7117,";;
    p174) INPUT="-19326 0 1689 0 28339" && OUTPUT="x=0,mat_colSize=0,y=1689,z=0,mat_rowSize=28339,";;
    p173) INPUT="-11905 0 0 31581 -10712" && OUTPUT="x=-11905,mat_colSize=0,y=0,z=31581,mat_rowSize=-10712,";;
    p172) INPUT="0 0 26089 -10189 3031" && OUTPUT="x=0,mat_colSize=0,y=26089,z=-10189,mat_rowSize=3031,";;
    p171) INPUT="0 0 13170 28233 30123" && OUTPUT="x=0,mat_colSize=0,y=13170,z=28233,mat_rowSize=30123,";;
    p170) INPUT="6134 0 -26152 -21915 0" && OUTPUT="x=0,mat_colSize=0,y=-26152,z=-21915,";;
    p169) INPUT="0 -15119 0 -25331 -18558" && OUTPUT="x=0,mat_colSize=-15119,y=0,z=-25331,mat_rowSize=-18558,";;
    p168) INPUT="0 0 0 24079 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=24079,";;
    p167) INPUT="-11655 0 -32697 -2223 6722" && OUTPUT="x=0,mat_colSize=0,y=-32697,z=-2223,mat_rowSize=6722,";;
    p166) INPUT="0 0 21734 -452 -31581" && OUTPUT="x=0,mat_colSize=0,y=21734,z=-452,mat_rowSize=-31581,";;
    p165) INPUT="31569 -1160 24209 -29023 -15148" && OUTPUT="x=31569,mat_colSize=-1160,y=24209,z=-29023,mat_rowSize=-15148,";;
    p164) INPUT="19923 0 11693 29917 16712" && OUTPUT="x=0,mat_colSize=0,y=11693,z=29917,mat_rowSize=16712,";;
    p163) INPUT="-21062 -31299 12211 -4067 0" && OUTPUT="x=-21062,mat_colSize=-31299,y=12211,z=-4067,";;
    p162) INPUT="-29967 -25314 -32352 25350 9949" && OUTPUT="x=-29967,mat_colSize=-25314,y=-32352,z=25350,mat_rowSize=9949,";;
    p161) INPUT="0 0 -11114 2819 7599" && OUTPUT="x=0,mat_colSize=0,y=-11114,z=2819,mat_rowSize=7599,";;
    p160) INPUT="-21181 -11143 -4791 5225 0" && OUTPUT="x=-21181,mat_colSize=-11143,y=-4791,z=5225,";;
    p159) INPUT="8808 25571 -7985 15648 -8153" && OUTPUT="x=8808,mat_colSize=25571,y=-7985,z=15648,mat_rowSize=-8153,";;
    p158) INPUT="13068 -21308 31978 2675 6206" && OUTPUT="x=13068,mat_colSize=-21308,y=31978,z=2675,mat_rowSize=6206,";;
    p157) INPUT="0 0 0 0 7241" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=7241,";;
    p156) INPUT="0 12682 -30557 27331 -24336" && OUTPUT="x=0,mat_colSize=12682,y=-30557,z=27331,mat_rowSize=-24336,";;
    p155) INPUT="-25265 -16505 0 0 7678" && OUTPUT="x=-25265,mat_colSize=-16505,y=0,z=0,mat_rowSize=7678,";;
    p154) INPUT="0 0 19830 -6015 -693" && OUTPUT="x=0,mat_colSize=0,y=19830,z=-6015,mat_rowSize=-693,";;
    p153) INPUT="0 -18901 0 -17827 4983" && OUTPUT="x=0,mat_colSize=-18901,y=0,z=-17827,mat_rowSize=4983,";;
    p152) INPUT="-16529 0 18120 -32355 27487" && OUTPUT="x=0,mat_colSize=0,y=18120,z=-32355,mat_rowSize=27487,";;
    p151) INPUT="24682 19286 -25353 -17292 -28406" && OUTPUT="x=24682,mat_colSize=19286,y=-25353,z=-17292,mat_rowSize=-28406,";;
    p150) INPUT="0 0 -28105 -21295 -27728" && OUTPUT="x=0,mat_colSize=0,y=-28105,z=-21295,mat_rowSize=-27728,";;
    p149) INPUT="-12733 32740 -2207 0 -32468" && OUTPUT="x=-12733,mat_colSize=32740,y=-2207,z=0,mat_rowSize=-32468,";;
    p148) INPUT="-32114 -8805 31426 0 0" && OUTPUT="x=-32114,mat_colSize=-8805,y=31426,z=0,";;
    p147) INPUT="-22697 0 8666 0 0" && OUTPUT="x=0,mat_colSize=0,y=8666,z=0,";;
    p146) INPUT="2949 25821 0 -21665 -8001" && OUTPUT="x=2949,mat_colSize=25821,y=0,z=-21665,mat_rowSize=-8001,";;
    p145) INPUT="0 0 25501 4623 0" && OUTPUT="x=0,mat_colSize=0,y=25501,z=4623,";;
    p144) INPUT="-268 -11241 0 0 23060" && OUTPUT="x=-268,mat_colSize=-11241,y=0,z=0,mat_rowSize=23060,";;
    p143) INPUT="0 -23147 -32411 -19747 -11782" && OUTPUT="x=0,mat_colSize=-23147,y=-32411,z=-19747,mat_rowSize=-11782,";;
    p142) INPUT="-17236 0 -8307 27455 19835" && OUTPUT="x=0,mat_colSize=0,y=-8307,z=27455,mat_rowSize=19835,";;
    p141) INPUT="13146 0 -6289 27377 -32435" && OUTPUT="x=13146,mat_colSize=0,y=-6289,z=27377,mat_rowSize=-32435,";;
    p140) INPUT="4057 -18693 -20731 -3862 0" && OUTPUT="x=4057,mat_colSize=-18693,y=-20731,z=-3862,";;
    p139) INPUT="-30922 -26628 -4260 -30008 -2858" && OUTPUT="x=-30922,mat_colSize=-26628,y=-4260,z=-30008,mat_rowSize=-2858,";;
    p138) INPUT="-28377 0 -8763 -32130 29901" && OUTPUT="x=0,mat_colSize=0,y=-8763,z=-32130,mat_rowSize=29901,";;
    p137) INPUT="0 7063 0 2660 -28709" && OUTPUT="x=0,mat_colSize=7063,y=0,z=2660,mat_rowSize=-28709,";;
    p136) INPUT="29840 0 -7251 0 -2153" && OUTPUT="x=29840,mat_colSize=0,y=-7251,z=0,mat_rowSize=-2153,";;
    p135) INPUT="0 3228 -7401 -29026 -18269" && OUTPUT="x=0,mat_colSize=3228,y=-7401,z=-29026,mat_rowSize=-18269,";;
    p134) INPUT="0 -20879 216 -1161 -5663" && OUTPUT="x=0,mat_colSize=-20879,y=216,z=-1161,mat_rowSize=-5663,";;
    p133) INPUT="-23366 0 0 -29206 -16211" && OUTPUT="x=-23366,mat_colSize=0,y=0,z=-29206,mat_rowSize=-16211,";;
    p132) INPUT="0 13751 0 4627 -19667" && OUTPUT="x=0,mat_colSize=13751,y=0,z=4627,mat_rowSize=-19667,";;
    p131) INPUT="0 2031 0 -20914 -4953" && OUTPUT="x=0,mat_colSize=2031,y=0,z=-20914,mat_rowSize=-4953,";;
    p130) INPUT="0 0 3065 0 -13555" && OUTPUT="x=0,mat_colSize=0,y=3065,z=0,mat_rowSize=-13555,";;
    p129) INPUT="32473 0 2473 13839 0" && OUTPUT="x=0,mat_colSize=0,y=2473,z=13839,";;
    p128) INPUT="23232 -23906 30899 8890 24384" && OUTPUT="x=23232,mat_colSize=-23906,y=30899,z=8890,mat_rowSize=24384,";;
    p127) INPUT="18848 0 20174 0 32343" && OUTPUT="x=0,mat_colSize=0,y=20174,z=0,mat_rowSize=32343,";;
    p126) INPUT="23191 -15664 -11405 0 27204" && OUTPUT="x=23191,mat_colSize=-15664,y=-11405,z=0,mat_rowSize=27204,";;
    p125) INPUT="2314 0 -9169 1457 0" && OUTPUT="x=0,mat_colSize=0,y=-9169,z=1457,";;
    p124) INPUT="-22510 0 0 0 2313" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=2313,";;
    p123) INPUT="15203 -5967 0 13103 -25663" && OUTPUT="x=15203,mat_colSize=-5967,y=0,z=13103,mat_rowSize=-25663,";;
    p122) INPUT="0 0 31563 0 0" && OUTPUT="x=0,mat_colSize=0,y=31563,z=0,";;
    p121) INPUT="23513 -5360 -23657 0 -8018" && OUTPUT="x=23513,mat_colSize=-5360,y=-23657,z=0,mat_rowSize=-8018,";;
    p120) INPUT="16758 0 -10763 1131 -16475" && OUTPUT="x=16758,mat_colSize=0,y=-10763,z=1131,mat_rowSize=-16475,";;
    p119) INPUT="23319 -27220 1757 0 -23985" && OUTPUT="x=23319,mat_colSize=-27220,y=1757,z=0,mat_rowSize=-23985,";;
    p118) INPUT="2647 8512 0 24517 -1862" && OUTPUT="x=2647,mat_colSize=8512,y=0,z=24517,mat_rowSize=-1862,";;
    p117) INPUT="-19073 -25446 0 -12349 22235" && OUTPUT="x=-19073,mat_colSize=-25446,y=0,z=-12349,mat_rowSize=22235,";;
    p116) INPUT="0 0 0 -11668 10267" && OUTPUT="x=0,mat_colSize=0,y=0,z=-11668,mat_rowSize=10267,";;
    p115) INPUT="-23438 -16016 0 0 0" && OUTPUT="x=-23438,mat_colSize=-16016,y=0,z=0,";;
    p114) INPUT="-17354 0 4745 -24594 -23823" && OUTPUT="x=-17354,mat_colSize=0,y=4745,z=-24594,mat_rowSize=-23823,";;
    p113) INPUT="-6912 22750 18319 1313 -3316" && OUTPUT="x=-6912,mat_colSize=22750,y=18319,z=1313,mat_rowSize=-3316,";;
    p112) INPUT="439 -22485 6560 256 0" && OUTPUT="x=439,mat_colSize=-22485,y=6560,z=256,";;
    p111) INPUT="-23758 0 0 -7187 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=-7187,";;
    p110) INPUT="0 -18074 -32058 0 0" && OUTPUT="x=0,mat_colSize=-18074,y=-32058,z=0,";;
    p109) INPUT="-19799 -23530 0 0 31090" && OUTPUT="x=-19799,mat_colSize=-23530,y=0,z=0,mat_rowSize=31090,";;
    p108) INPUT="-30035 -1844 -15877 -31284 0" && OUTPUT="x=-30035,mat_colSize=-1844,y=-15877,z=-31284,";;
    p107) INPUT="0 0 29489 10207 -1224" && OUTPUT="x=0,mat_colSize=0,y=29489,z=10207,mat_rowSize=-1224,";;
    p106) INPUT="0 12475 19300 16226 -18040" && OUTPUT="x=0,mat_colSize=12475,y=19300,z=16226,mat_rowSize=-18040,";;
    p105) INPUT="5030 11739 -27208 0 -25957" && OUTPUT="x=5030,mat_colSize=11739,y=-27208,z=0,mat_rowSize=-25957,";;
    p104) INPUT="0 32126 20645 31050 -384" && OUTPUT="x=0,mat_colSize=32126,y=20645,z=31050,mat_rowSize=-384,";;
    p103) INPUT="0 -26845 0 0 0" && OUTPUT="x=0,mat_colSize=-26845,y=0,z=0,";;
    p102) INPUT="0 -4645 0 0 -14767" && OUTPUT="x=0,mat_colSize=-4645,y=0,z=0,mat_rowSize=-14767,";;
    p101) INPUT="25740 2081 1106 0 -15238" && OUTPUT="x=25740,mat_colSize=2081,y=1106,z=0,mat_rowSize=-15238,";;
    p100) INPUT="-4334 0 4450 -7756 22223" && OUTPUT="x=0,mat_colSize=0,y=4450,z=-7756,mat_rowSize=22223,";;
    p99) INPUT="-11716 -4072 -741 0 0" && OUTPUT="x=-11716,mat_colSize=-4072,y=-741,z=0,";;
    p98) INPUT="0 8244 0 13762 -3298" && OUTPUT="x=0,mat_colSize=8244,y=0,z=13762,mat_rowSize=-3298,";;
    p97) INPUT="16588 0 11725 0 0" && OUTPUT="x=0,mat_colSize=0,y=11725,z=0,";;
    p96) INPUT="26529 -19144 15360 28921 30952" && OUTPUT="x=26529,mat_colSize=-19144,y=15360,z=28921,mat_rowSize=30952,";;
    p95) INPUT="0 -22532 -321 -9429 7313" && OUTPUT="x=0,mat_colSize=-22532,y=-321,z=-9429,mat_rowSize=7313,";;
    p94) INPUT="0 0 0 -16107 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=-16107,";;
    p93) INPUT="0 0 0 -16690 -10117" && OUTPUT="x=0,mat_colSize=0,y=0,z=-16690,mat_rowSize=-10117,";;
    p92) INPUT="24949 -27626 0 21792 0" && OUTPUT="x=24949,mat_colSize=-27626,y=0,z=21792,";;
    p91) INPUT="21724 0 0 0 9970" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=9970,";;
    p90) INPUT="-30114 -11119 5845 -7 3157" && OUTPUT="x=-30114,mat_colSize=-11119,y=5845,z=-7,mat_rowSize=3157,";;
    p89) INPUT="-29603 -4878 23803 -2390 0" && OUTPUT="x=-29603,mat_colSize=-4878,y=23803,z=-2390,";;
    p88) INPUT="23319 -28253 -5017 0 15615" && OUTPUT="x=23319,mat_colSize=-28253,y=-5017,z=0,mat_rowSize=15615,";;
    p87) INPUT="-25660 -4579 0 0 31062" && OUTPUT="x=-25660,mat_colSize=-4579,y=0,z=0,mat_rowSize=31062,";;
    p86) INPUT="4652 -8732 -21550 1963 -18713" && OUTPUT="x=4652,mat_colSize=-8732,y=-21550,z=1963,mat_rowSize=-18713,";;
    p85) INPUT="16368 -23542 -6793 -15660 0" && OUTPUT="x=16368,mat_colSize=-23542,y=-6793,z=-15660,";;
    p84) INPUT="22053 0 0 16535 -19285" && OUTPUT="x=22053,mat_colSize=0,y=0,z=16535,mat_rowSize=-19285,";;
    p83) INPUT="0 -2426 27333 0 -3589" && OUTPUT="x=0,mat_colSize=-2426,y=27333,z=0,mat_rowSize=-3589,";;
    p82) INPUT="-31082 0 0 -27644 -32502" && OUTPUT="x=-31082,mat_colSize=0,y=0,z=-27644,mat_rowSize=-32502,";;
    p81) INPUT="27784 21811 -29715 7387 -30035" && OUTPUT="x=27784,mat_colSize=21811,y=-29715,z=7387,mat_rowSize=-30035,";;
    p80) INPUT="0 0 19107 0 -20352" && OUTPUT="x=0,mat_colSize=0,y=19107,z=0,mat_rowSize=-20352,";;
    p79) INPUT="0 -4370 -13335 0 -28652" && OUTPUT="x=0,mat_colSize=-4370,y=-13335,z=0,mat_rowSize=-28652,";;
    p78) INPUT="6105 -30170 0 -26950 -5491" && OUTPUT="x=6105,mat_colSize=-30170,y=0,z=-26950,mat_rowSize=-5491,";;
    p77) INPUT="0 -11081 0 -3555 0" && OUTPUT="x=0,mat_colSize=-11081,y=0,z=-3555,";;
    p76) INPUT="0 0 0 27123 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=27123,";;
    p75) INPUT="0 0 9000 8462 -11921" && OUTPUT="x=0,mat_colSize=0,y=9000,z=8462,mat_rowSize=-11921,";;
    p74) INPUT="-30035 7208 0 25652 -1530" && OUTPUT="x=-30035,mat_colSize=7208,y=0,z=25652,mat_rowSize=-1530,";;
    p73) INPUT="0 -28291 5874 0 8321" && OUTPUT="x=0,mat_colSize=-28291,y=5874,z=0,mat_rowSize=8321,";;
    p72) INPUT="-14455 -3928 0 31562 0" && OUTPUT="x=-14455,mat_colSize=-3928,y=0,z=31562,";;
    p71) INPUT="17835 0 -13923 0 27404" && OUTPUT="x=0,mat_colSize=0,y=-13923,z=0,mat_rowSize=27404,";;
    p70) INPUT="2517 -4242 -24031 0 -15427" && OUTPUT="x=2517,mat_colSize=-4242,y=-24031,z=0,mat_rowSize=-15427,";;
    p69) INPUT="18489 -32627 0 -6499 -24758" && OUTPUT="x=18489,mat_colSize=-32627,y=0,z=-6499,mat_rowSize=-24758,";;
    p68) INPUT="0 0 8032 -16852 0" && OUTPUT="x=0,mat_colSize=0,y=8032,z=-16852,";;
    p67) INPUT="22660 0 0 -26004 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=-26004,";;
    p66) INPUT="-28753 0 1159 -18290 14760" && OUTPUT="x=0,mat_colSize=0,y=1159,z=-18290,mat_rowSize=14760,";;
    p65) INPUT="-19588 0 25842 -4809 -18729" && OUTPUT="x=-19588,mat_colSize=0,y=25842,z=-4809,mat_rowSize=-18729,";;
    p64) INPUT="0 0 -10757 7855 -32504" && OUTPUT="x=0,mat_colSize=0,y=-10757,z=7855,mat_rowSize=-32504,";;
    p63) INPUT="-27215 -28848 -18754 4884 0" && OUTPUT="x=-27215,mat_colSize=-28848,y=-18754,z=4884,";;
    p62) INPUT="-13874 -17607 -14591 0 0" && OUTPUT="x=-13874,mat_colSize=-17607,y=-14591,z=0,";;
    p61) INPUT="-26626 -15342 17498 1074 14901" && OUTPUT="x=-26626,mat_colSize=-15342,y=17498,z=1074,mat_rowSize=14901,";;
    p60) INPUT="14695 0 0 0 -15953" && OUTPUT="x=14695,mat_colSize=0,y=0,z=0,mat_rowSize=-15953,";;
    p59) INPUT="-26497 0 0 30035 -25797" && OUTPUT="x=-26497,mat_colSize=0,y=0,z=30035,mat_rowSize=-25797,";;
    p58) INPUT="-24134 0 -19509 0 -4117" && OUTPUT="x=-24134,mat_colSize=0,y=-19509,z=0,mat_rowSize=-4117,";;
    p57) INPUT="8616 -7844 24192 1324 0" && OUTPUT="x=8616,mat_colSize=-7844,y=24192,z=1324,";;
    p56) INPUT="14858 -10170 11183 -17425 0" && OUTPUT="x=14858,mat_colSize=-10170,y=11183,z=-17425,";;
    p55) INPUT="11236 -16537 0 -267 0" && OUTPUT="x=11236,mat_colSize=-16537,y=0,z=-267,";;
    p54) INPUT="18903 0 11905 -19201 18061" && OUTPUT="x=0,mat_colSize=0,y=11905,z=-19201,mat_rowSize=18061,";;
    p53) INPUT="-2295 0 28371 30923 0" && OUTPUT="x=0,mat_colSize=0,y=28371,z=30923,";;
    p52) INPUT="0 -3499 22713 4383 -29729" && OUTPUT="x=0,mat_colSize=-3499,y=22713,z=4383,mat_rowSize=-29729,";;
    p51) INPUT="-7345 0 80 15554 -30259" && OUTPUT="x=-7345,mat_colSize=0,y=80,z=15554,mat_rowSize=-30259,";;
    p50) INPUT="0 0 0 24074 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=24074,";;
    p49) INPUT="0 379 5686 0 -1324" && OUTPUT="x=0,mat_colSize=379,y=5686,z=0,mat_rowSize=-1324,";;
    p48) INPUT="0 -30145 0 -22920 0" && OUTPUT="x=0,mat_colSize=-30145,y=0,z=-22920,";;
    p47) INPUT="15670 0 28132 0 -11541" && OUTPUT="x=15670,mat_colSize=0,y=28132,z=0,mat_rowSize=-11541,";;
    p46) INPUT="0 0 12180 0 13882" && OUTPUT="x=0,mat_colSize=0,y=12180,z=0,mat_rowSize=13882,";;
    p45) INPUT="28718 13197 -20857 22896 -2508" && OUTPUT="x=28718,mat_colSize=13197,y=-20857,z=22896,mat_rowSize=-2508,";;
    p44) INPUT="25355 0 0 0 10268" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,mat_rowSize=10268,";;
    p43) INPUT="21726 -25238 18047 0 -23891" && OUTPUT="x=21726,mat_colSize=-25238,y=18047,z=0,mat_rowSize=-23891,";;
    p42) INPUT="-6246 -23410 12985 18226 -8937" && OUTPUT="x=-6246,mat_colSize=-23410,y=12985,z=18226,mat_rowSize=-8937,";;
    p41) INPUT="22728 -20430 0 10998 -19412" && OUTPUT="x=22728,mat_colSize=-20430,y=0,z=10998,mat_rowSize=-19412,";;
    p40) INPUT="28462 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p39) INPUT="-24707 -22955 0 0 -30018" && OUTPUT="x=-24707,mat_colSize=-22955,y=0,z=0,mat_rowSize=-30018,";;
    p38) INPUT="1983 0 13299 -6475 0" && OUTPUT="x=0,mat_colSize=0,y=13299,z=-6475,";;
    p37) INPUT="26121 -22620 0 11172 0" && OUTPUT="x=26121,mat_colSize=-22620,y=0,z=11172,";;
    p36) INPUT="8892 24828 -1435 -29380 -11862" && OUTPUT="x=8892,mat_colSize=24828,y=-1435,z=-29380,mat_rowSize=-11862,";;
    p35) INPUT="22332 0 -31346 26672 0" && OUTPUT="x=0,mat_colSize=0,y=-31346,z=26672,";;
    p34) INPUT="30807 13940 0 -3360 -11302" && OUTPUT="x=30807,mat_colSize=13940,y=0,z=-3360,mat_rowSize=-11302,";;
    p33) INPUT="-13337 -30702 -4450 0 -26169" && OUTPUT="x=-13337,mat_colSize=-30702,y=-4450,z=0,mat_rowSize=-26169,";;
    p32) INPUT="-15074 0 0 0 -17584" && OUTPUT="x=-15074,mat_colSize=0,y=0,z=0,mat_rowSize=-17584,";;
    p31) INPUT="20733 0 6564 18491 9825" && OUTPUT="x=0,mat_colSize=0,y=6564,z=18491,mat_rowSize=9825,";;
    p30) INPUT="0 -10458 -28155 0 9184" && OUTPUT="x=0,mat_colSize=-10458,y=-28155,z=0,mat_rowSize=9184,";;
    p29) INPUT="983 0 9194 -7343 0" && OUTPUT="x=0,mat_colSize=0,y=9194,z=-7343,";;
    p28) INPUT="14360 -11017 31473 -26859 0" && OUTPUT="x=14360,mat_colSize=-11017,y=31473,z=-26859,";;
    p27) INPUT="10058 -9462 24996 0 32018" && OUTPUT="x=10058,mat_colSize=-9462,y=24996,z=0,mat_rowSize=32018,";;
    p26) INPUT="-15399 22212 -32262 0 -30119" && OUTPUT="x=-15399,mat_colSize=22212,y=-32262,z=0,mat_rowSize=-30119,";;
    p25) INPUT="0 -22529 -27735 2825 31835" && OUTPUT="x=0,mat_colSize=-22529,y=-27735,z=2825,mat_rowSize=31835,";;
    p24) INPUT="0 -19180 -8698 -26597 0" && OUTPUT="x=0,mat_colSize=-19180,y=-8698,z=-26597,";;
    p23) INPUT="-16663 0 0 -367 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=-367,";;
    p22) INPUT="16076 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p21) INPUT="-21205 0 0 0 -31699" && OUTPUT="x=-21205,mat_colSize=0,y=0,z=0,mat_rowSize=-31699,";;
    p20) INPUT="22220 -9538 0 0 0" && OUTPUT="x=22220,mat_colSize=-9538,y=0,z=0,";;
    p19) INPUT="10398 4389 -18627 8741 -4733" && OUTPUT="x=10398,mat_colSize=4389,y=-18627,z=8741,mat_rowSize=-4733,";;
    p18) INPUT="28773 -25968 0 12470 -18384" && OUTPUT="x=28773,mat_colSize=-25968,y=0,z=12470,mat_rowSize=-18384,";;
    p17) INPUT="-26084 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p16) INPUT="-29861 -13964 -15010 20069 0" && OUTPUT="x=-29861,mat_colSize=-13964,y=-15010,z=20069,";;
    p15) INPUT="-18965 -17520 1558 -30425 0" && OUTPUT="x=-18965,mat_colSize=-17520,y=1558,z=-30425,";;
    p14) INPUT="8985 0 0 14709 -13470" && OUTPUT="x=8985,mat_colSize=0,y=0,z=14709,mat_rowSize=-13470,";;
    p13) INPUT="30798 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p12) INPUT="0 0 1182 20811 -10744" && OUTPUT="x=0,mat_colSize=0,y=1182,z=20811,mat_rowSize=-10744,";;
    p11) INPUT="11407 -17637 12813 16009 0" && OUTPUT="x=11407,mat_colSize=-17637,y=12813,z=16009,";;
    p10) INPUT="22698 0 -13859 27551 0" && OUTPUT="x=0,mat_colSize=0,y=-13859,z=27551,";;
    p9) INPUT="0 -27892 -16689 7044 19138" && OUTPUT="x=0,mat_colSize=-27892,y=-16689,z=7044,mat_rowSize=19138,";;
    p8) INPUT="0 0 0 0 0" && OUTPUT="x=0,mat_colSize=0,y=0,z=0,";;
    p7) INPUT="17335 0 -31263 10392 0" && OUTPUT="x=0,mat_colSize=0,y=-31263,z=10392,";;
    p6) INPUT="9204 10718 17819 0 -25571" && OUTPUT="x=9204,mat_colSize=10718,y=17819,z=0,mat_rowSize=-25571,";;
    p5) INPUT="0 0 -24599 0 26749" && OUTPUT="x=0,mat_colSize=0,y=-24599,z=0,mat_rowSize=26749,";;
    p4) INPUT="0 18300 -8421 0 -4626" && OUTPUT="x=0,mat_colSize=18300,y=-8421,z=0,mat_rowSize=-4626,";;
    p3) INPUT="0 -438 26163 11180 10968" && OUTPUT="x=0,mat_colSize=-438,y=26163,z=11180,mat_rowSize=10968,";;
    p2) INPUT="27124 0 -22914 -25288 0" && OUTPUT="x=0,mat_colSize=0,y=-22914,z=-25288,";;
    p1) INPUT="0 0 -482 15117 26690" && OUTPUT="x=0,mat_colSize=0,y=-482,z=15117,mat_rowSize=26690,";;

    # Negative test cases:
    n100) INPUT="-11477 23573 24924 11418 17900" && OUTPUT="x=23573,mat_colSize=23573,y=17900,z=34991,mat_rowSize=17900,";;
    n99) INPUT="-1105 2492 30176 29713 14544" && OUTPUT="x=2492,mat_colSize=2492,y=14544,z=32205,mat_rowSize=14544,";;
    n98) INPUT="0 28195 -26753 -31991 7615" && OUTPUT="x=28195,mat_colSize=28195,y=7615,z=-3796,mat_rowSize=7615,";;
    n97) INPUT="0 5429 0 -29128 0" && OUTPUT="x=5429,mat_colSize=5429,y=0,z=-23699,";;
    n96) INPUT="15222 14097 -11907 26927 9988" && OUTPUT="x=14097,mat_colSize=14097,y=9988,z=41024,mat_rowSize=9988,";;
    n95) INPUT="-162 3646 -10702 16143 6394" && OUTPUT="x=3646,mat_colSize=3646,y=6394,z=19789,mat_rowSize=6394,";;
    n94) INPUT="-8767 22181 0 -4283 0" && OUTPUT="x=22181,mat_colSize=22181,y=0,z=17898,";;
    n93) INPUT="-16786 12637 -3228 0 0" && OUTPUT="x=12637,mat_colSize=12637,y=0,z=12637,";;
    n92) INPUT="0 19054 30242 -13705 13419" && OUTPUT="x=19054,mat_colSize=19054,y=13419,z=5349,mat_rowSize=13419,";;
    n91) INPUT="0 26590 -21922 14939 0" && OUTPUT="x=26590,mat_colSize=26590,y=0,z=41529,";;
    n90) INPUT="21999 13622 21771 27689 6199" && OUTPUT="x=13622,mat_colSize=13622,y=6199,z=41311,mat_rowSize=6199,";;
    n89) INPUT="-13954 12878 20963 11102 4155" && OUTPUT="x=12878,mat_colSize=12878,y=4155,z=23980,mat_rowSize=4155,";;
    n88) INPUT="0 4754 -14298 0 1402" && OUTPUT="x=4754,mat_colSize=4754,y=1402,z=4754,mat_rowSize=1402,";;
    n87) INPUT="32645 14119 -1870 31724 0" && OUTPUT="x=14119,mat_colSize=14119,y=0,z=45843,";;
    n86) INPUT="-10929 17411 0 -22805 16437" && OUTPUT="x=17411,mat_colSize=17411,y=16437,z=-5394,mat_rowSize=16437,";;
    n85) INPUT="23 1829 0 -16791 29688" && OUTPUT="x=1829,mat_colSize=1829,y=29688,z=-14962,mat_rowSize=29688,";;
    n84) INPUT="206 18436 0 -1176 15789" && OUTPUT="x=18436,mat_colSize=18436,y=15789,z=17260,mat_rowSize=15789,";;
    n83) INPUT="25562 24278 5903 -13044 0" && OUTPUT="x=24278,mat_colSize=24278,y=0,z=11234,";;
    n82) INPUT="-11864 26464 -6104 -28167 23714" && OUTPUT="x=26464,mat_colSize=26464,y=23714,z=-1703,mat_rowSize=23714,";;
    n81) INPUT="19578 5153 29501 5971 8378" && OUTPUT="x=5153,mat_colSize=5153,y=8378,z=11124,mat_rowSize=8378,";;
    n80) INPUT="-28732 763 -14723 31565 0" && OUTPUT="x=763,mat_colSize=763,y=0,z=32328,";;
    n79) INPUT="0 18572 0 26785 0" && OUTPUT="x=18572,mat_colSize=18572,y=0,z=45357,";;
    n78) INPUT="0 13331 -20064 20605 2723" && OUTPUT="x=13331,mat_colSize=13331,y=2723,z=33936,mat_rowSize=2723,";;
    n77) INPUT="13322 21194 0 -15259 0" && OUTPUT="x=21194,mat_colSize=21194,y=0,z=5935,";;
    n76) INPUT="6486 20534 0 24281 13867" && OUTPUT="x=20534,mat_colSize=20534,y=13867,z=44815,mat_rowSize=13867,";;
    n75) INPUT="-17728 10579 0 -13056 26542" && OUTPUT="x=10579,mat_colSize=10579,y=26542,z=-2477,mat_rowSize=26542,";;
    n74) INPUT="-28986 7465 -2352 0 0" && OUTPUT="x=7465,mat_colSize=7465,y=0,z=7465,";;
    n73) INPUT="-12408 120 447 -29258 0" && OUTPUT="x=120,mat_colSize=120,y=0,z=-29138,";;
    n72) INPUT="0 23060 0 0 3837" && OUTPUT="x=23060,mat_colSize=23060,y=3837,z=23060,mat_rowSize=3837,";;
    n71) INPUT="-20440 27440 -15458 -28378 22535" && OUTPUT="x=27440,mat_colSize=27440,y=22535,z=-938,mat_rowSize=22535,";;
    n70) INPUT="-21343 28034 7985 0 9188" && OUTPUT="x=28034,mat_colSize=28034,y=9188,z=28034,mat_rowSize=9188,";;
    n69) INPUT="26830 16099 -3963 25913 0" && OUTPUT="x=16099,mat_colSize=16099,y=0,z=42012,";;
    n68) INPUT="-18946 19730 0 -23414 25747" && OUTPUT="x=19730,mat_colSize=19730,y=25747,z=-3684,mat_rowSize=25747,";;
    n67) INPUT="18847 16760 0 0 0" && OUTPUT="x=16760,mat_colSize=16760,y=0,z=16760,";;
    n66) INPUT="4993 7959 0 27441 0" && OUTPUT="x=7959,mat_colSize=7959,y=0,z=35400,";;
    n65) INPUT="21246 25019 -23244 14421 0" && OUTPUT="x=25019,mat_colSize=25019,y=0,z=39440,";;
    n64) INPUT="0 2085 16946 30189 0" && OUTPUT="x=2085,mat_colSize=2085,y=0,z=32274,";;
    n63) INPUT="6197 28889 0 4039 11482" && OUTPUT="x=28889,mat_colSize=28889,y=11482,z=32928,mat_rowSize=11482,";;
    n62) INPUT="-19175 6486 20769 371 11459" && OUTPUT="x=6486,mat_colSize=6486,y=11459,z=6857,mat_rowSize=11459,";;
    n61) INPUT="26461 4651 30495 30390 24815" && OUTPUT="x=4651,mat_colSize=4651,y=24815,z=35041,mat_rowSize=24815,";;
    n60) INPUT="0 19968 0 1327 6511" && OUTPUT="x=19968,mat_colSize=19968,y=6511,z=21295,mat_rowSize=6511,";;
    n59) INPUT="27944 17137 0 22851 0" && OUTPUT="x=17137,mat_colSize=17137,y=0,z=39988,";;
    n58) INPUT="0 16984 0 0 16947" && OUTPUT="x=16984,mat_colSize=16984,y=16947,z=16984,mat_rowSize=16947,";;
    n57) INPUT="0 27924 0 0 8882" && OUTPUT="x=27924,mat_colSize=27924,y=8882,z=27924,mat_rowSize=8882,";;
    n56) INPUT="21638 8894 -38 0 0" && OUTPUT="x=8894,mat_colSize=8894,y=0,z=8894,";;
    n55) INPUT="2299 17965 3090 -32468 0" && OUTPUT="x=17965,mat_colSize=17965,y=0,z=-14503,";;
    n54) INPUT="-22170 3470 32013 11652 7668" && OUTPUT="x=3470,mat_colSize=3470,y=7668,z=15122,mat_rowSize=7668,";;
    n53) INPUT="-25367 11663 8428 21238 0" && OUTPUT="x=11663,mat_colSize=11663,y=0,z=32901,";;
    n52) INPUT="-26552 8481 -17437 30584 23854" && OUTPUT="x=8481,mat_colSize=8481,y=23854,z=39065,mat_rowSize=23854,";;
    n51) INPUT="5652 21339 0 -14857 0" && OUTPUT="x=21339,mat_colSize=21339,y=0,z=6482,";;
    n50) INPUT="-2321 30891 0 0 21672" && OUTPUT="x=30891,mat_colSize=30891,y=21672,z=30891,mat_rowSize=21672,";;
    n49) INPUT="0 192 0 -4583 8185" && OUTPUT="x=192,mat_colSize=192,y=8185,z=-4391,mat_rowSize=8185,";;
    n48) INPUT="0 14004 0 -15437 0" && OUTPUT="x=14004,mat_colSize=14004,y=0,z=-1433,";;
    n47) INPUT="0 31796 0 -7320 0" && OUTPUT="x=31796,mat_colSize=31796,y=0,z=24476,";;
    n46) INPUT="0 32662 22275 15926 14540" && OUTPUT="x=32662,mat_colSize=32662,y=14540,z=48588,mat_rowSize=14540,";;
    n45) INPUT="-5072 29773 0 1905 0" && OUTPUT="x=29773,mat_colSize=29773,y=0,z=31678,";;
    n44) INPUT="-27083 2013 -24111 0 0" && OUTPUT="x=2013,mat_colSize=2013,y=0,z=2013,";;
    n43) INPUT="22217 8039 0 5553 0" && OUTPUT="x=8039,mat_colSize=8039,y=0,z=13592,";;
    n42) INPUT="-15918 21282 16136 12947 20768" && OUTPUT="x=21282,mat_colSize=21282,y=20768,z=34229,mat_rowSize=20768,";;
    n41) INPUT="-16309 5818 7517 72 27943" && OUTPUT="x=5818,mat_colSize=5818,y=27943,z=5890,mat_rowSize=27943,";;
    n40) INPUT="0 25998 -21313 0 20079" && OUTPUT="x=25998,mat_colSize=25998,y=20079,z=25998,mat_rowSize=20079,";;
    n39) INPUT="-6174 8763 10754 12046 26534" && OUTPUT="x=8763,mat_colSize=8763,y=26534,z=20809,mat_rowSize=26534,";;
    n38) INPUT="16840 5173 0 -27330 0" && OUTPUT="x=5173,mat_colSize=5173,y=0,z=-22157,";;
    n37) INPUT="-32727 22868 4347 29230 7844" && OUTPUT="x=22868,mat_colSize=22868,y=7844,z=52098,mat_rowSize=7844,";;
    n36) INPUT="13478 13001 -17809 32756 28762" && OUTPUT="x=13001,mat_colSize=13001,y=28762,z=45757,mat_rowSize=28762,";;
    n35) INPUT="0 19433 -27065 -6873 0" && OUTPUT="x=19433,mat_colSize=19433,y=0,z=12560,";;
    n34) INPUT="0 30829 0 0 0" && OUTPUT="x=30829,mat_colSize=30829,y=0,z=30829,";;
    n33) INPUT="0 26741 -22934 0 19226" && OUTPUT="x=26741,mat_colSize=26741,y=19226,z=26741,mat_rowSize=19226,";;
    n32) INPUT="-32370 135 0 5356 28281" && OUTPUT="x=135,mat_colSize=135,y=28281,z=5491,mat_rowSize=28281,";;
    n31) INPUT="12473 24295 10305 0 29530" && OUTPUT="x=24295,mat_colSize=24295,y=29530,z=24295,mat_rowSize=29530,";;
    n30) INPUT="-6430 16138 0 -27848 0" && OUTPUT="x=16138,mat_colSize=16138,y=0,z=-11710,";;
    n29) INPUT="-10072 30176 22124 0 0" && OUTPUT="x=30176,mat_colSize=30176,y=0,z=30176,";;
    n28) INPUT="12877 27312 -2758 -5849 30436" && OUTPUT="x=27312,mat_colSize=27312,y=30436,z=21463,mat_rowSize=30436,";;
    n27) INPUT="0 25234 -16274 0 1389" && OUTPUT="x=25234,mat_colSize=25234,y=1389,z=25234,mat_rowSize=1389,";;
    n26) INPUT="21271 2462 0 25670 0" && OUTPUT="x=2462,mat_colSize=2462,y=0,z=28132,";;
    n25) INPUT="-26555 29648 -6158 -8982 21087" && OUTPUT="x=29648,mat_colSize=29648,y=21087,z=20666,mat_rowSize=21087,";;
    n24) INPUT="-22896 31850 0 -28445 12544" && OUTPUT="x=31850,mat_colSize=31850,y=12544,z=3405,mat_rowSize=12544,";;
    n23) INPUT="0 23033 0 -9811 16662" && OUTPUT="x=23033,mat_colSize=23033,y=16662,z=13222,mat_rowSize=16662,";;
    n22) INPUT="24341 10440 -2354 6262 7673" && OUTPUT="x=10440,mat_colSize=10440,y=7673,z=16702,mat_rowSize=7673,";;
    n21) INPUT="0 23119 0 13870 0" && OUTPUT="x=23119,mat_colSize=23119,y=0,z=36989,";;
    n20) INPUT="17628 20600 2160 0 0" && OUTPUT="x=20600,mat_colSize=20600,y=0,z=20600,";;
    n19) INPUT="-6305 19389 22221 0 24708" && OUTPUT="x=19389,mat_colSize=19389,y=24708,z=19389,mat_rowSize=24708,";;
    n18) INPUT="256 31270 -14755 0 0" && OUTPUT="x=31270,mat_colSize=31270,y=0,z=31270,";;
    n17) INPUT="31744 10342 28489 0 0" && OUTPUT="x=10342,mat_colSize=10342,y=0,z=10342,";;
    n16) INPUT="0 22572 0 0 12982" && OUTPUT="x=22572,mat_colSize=22572,y=12982,z=22572,mat_rowSize=12982,";;
    n15) INPUT="-25909 30414 -11571 -1352 12347" && OUTPUT="x=30414,mat_colSize=30414,y=12347,z=29062,mat_rowSize=12347,";;
    n14) INPUT="0 9411 22238 -23501 17768" && OUTPUT="x=9411,mat_colSize=9411,y=17768,z=-14090,mat_rowSize=17768,";;
    n13) INPUT="5384 21797 -27422 28682 0" && OUTPUT="x=21797,mat_colSize=21797,y=0,z=50479,";;
    n12) INPUT="0 31935 0 -30257 0" && OUTPUT="x=31935,mat_colSize=31935,y=0,z=1678,";;
    n11) INPUT="133 21808 0 2292 30841" && OUTPUT="x=21808,mat_colSize=21808,y=30841,z=24100,mat_rowSize=30841,";;
    n10) INPUT="-16845 31231 0 -14537 13629" && OUTPUT="x=31231,mat_colSize=31231,y=13629,z=16694,mat_rowSize=13629,";;
    n9) INPUT="0 822 26871 -23193 0" && OUTPUT="x=822,mat_colSize=822,y=0,z=-22371,";;
    n8) INPUT="-1526 6592 0 -28204 0" && OUTPUT="x=6592,mat_colSize=6592,y=0,z=-21612,";;
    n7) INPUT="0 15143 0 0 0" && OUTPUT="x=15143,mat_colSize=15143,y=0,z=15143,";;
    n6) INPUT="15106 30709 0 7789 12121" && OUTPUT="x=30709,mat_colSize=30709,y=12121,z=38498,mat_rowSize=12121,";;
    n5) INPUT="0 32147 0 29564 0" && OUTPUT="x=32147,mat_colSize=32147,y=0,z=61711,";;
    n4) INPUT="32158 17142 -9678 0 0" && OUTPUT="x=17142,mat_colSize=17142,y=0,z=17142,";;
    n3) INPUT="24173 25449 0 -1044 18385" && OUTPUT="x=25449,mat_colSize=25449,y=18385,z=24405,mat_rowSize=18385,";;
    n2) INPUT="-10611 24236 -29918 -21678 27357" && OUTPUT="x=24236,mat_colSize=24236,y=27357,z=2558,mat_rowSize=27357,";;
    n1) INPUT="0 29023 0 8239 0" && OUTPUT="x=29023,mat_colSize=29023,y=0,z=37262,";;

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
