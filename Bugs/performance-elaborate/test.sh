#!/bin/bash
# $1 = EXE
# $2 = test name
# $3 = port
# $4 = source name
# $5 = single-fitness-file name
# exit 0 = success

echo "$1" "$2" "$3" "$4" "$5" >> testruns.txt

INPUT=""                        # Set by test case
OUTPUT=""                       # Set by test case
ACTUAL_OUTPUT=""
TIME_LIMIT=0.5                  # In seconds
EXIT=255

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
    p11) INPUT="10 end" && OUTPUT="10";;
    p10) INPUT="100 end" && OUTPUT="100";;
    p9) INPUT="1000 end" && OUTPUT="1000";;

    p8) INPUT="10 middle" && OUTPUT="5";;
    p7) INPUT="100 middle" && OUTPUT="50";;
    p6) INPUT="1000 middle" && OUTPUT="500";;

    p5) INPUT="100000 beginning" && OUTPUT="0";;
    p4) INPUT="10000 beginning" && OUTPUT="0";;
    p3) INPUT="1000 beginning" && OUTPUT="0";;
    p2) INPUT="100 beginning" && OUTPUT="0";;
    p1) INPUT="10 beginning" && OUTPUT="0";;

    # Negative test cases:
    n1) INPUT="100000 middle" && OUTPUT="50000" && TIME_LIMIT=1.5;;
    n2) INPUT="100000 end" && OUTPUT="100000" && TIME_LIMIT=7;;
esac

if [[ $4 == *"coverage"* ]]; then
     TIME_LIMIT=5;
     ACTUAL_OUTPUT="$(timeout "$TIME_LIMIT"s "$1" $INPUT)"
     EXIT=$?
     log "$@"
     [[ $2 = *"p"* ]] && exit 0
     exit 1
fi;

ACTUAL_OUTPUT="$(timeout "$TIME_LIMIT"s "$1" $INPUT)"
EXIT=$?

if [ $EXIT = 0 ]; then
    if [ "$OUTPUT" = "$ACTUAL_OUTPUT" ]; then
        EXIT=0;
    else
        EXIT=101;
    fi;
fi;

log "$@"
exit $EXIT

