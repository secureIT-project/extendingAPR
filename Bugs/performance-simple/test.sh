#!/bin/bash
# $1 = EXE
# $2 = test name
# $3 = port
# $4 = source name
# $5 = single-fitness-file name
# exit 0 = success

ulimit -t 1

echo "$1" "$2" "$3" "$4" "$5" >> testruns.txt

INPUT=""                        # Set by test case
OUTPUT=""                       # Set by test case
ACTUAL_OUTPUT=""
EXIT=101

log()
{
    {
    printf "Input arguments: %s\n" "$*"

    printf "\tInput: %s\n" "${INPUT[*]}"
    printf "\tExpected output: %s\n" "$OUTPUT"
    printf "\tActual output: %s\n" "$ACTUAL_OUTPUT"
    printf "\tExit code: %d\n" "$EXIT"
    } >> testruns.txt
}

case $2 in
    # Positive test cases:
    p5) INPUT="5000" && OUTPUT="12497500";;
    p4) INPUT="1000" && OUTPUT="499500";;
    p3) INPUT="500" && OUTPUT="124750";;
    p2) INPUT="100" && OUTPUT="4950";;
    p1) INPUT="0" && OUTPUT="0";;

    # Negative test cases:
    n1) INPUT="20000" && OUTPUT="199990000";;

esac

if [[ $4 == *"coverage"* ]]; then
     TIME_LIMIT=5;
     ACTUAL_OUTPUT="$(timeout "$TIME_LIMIT"s "$1" $INPUT)"
     EXIT=$?
     log "$@"
     [[ $2 = *"p"* ]] && exit 0
     exit 1
fi;

ACTUAL_OUTPUT="$(timeout 1s "$1" $INPUT)"
EXIT=$?
log "$@"

[ "$OUTPUT" = "$ACTUAL_OUTPUT" ] && exit 0;
exit 1
