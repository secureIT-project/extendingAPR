#!/bin/bash

test_case(){
    # $1 - executable
    # rest  - arguments

    # Assume hard hang after 2 second of CPU time
    ulimit -t 2

    local executable="$1"; shift
    local arguments=( "${@}" )

    info "Running test case with arguments: ${arguments[*]}"

    "$executable" ${arguments[@]} && return 0;
    return 1;
}

append_negative_test_case_with_output(){
    # $1 - test.sh
    # $2 - expected output
    # rest - arguments

    local file="$1"; shift
    local output="$1"; shift
    local arguments=( "${@}" )

    index="$(grep -E '\s*n[0-9]+\)' "$file" | head -n 1 | grep -oP '(?<=n).*?(?=\))' | head -n 1)"
    [ -z "$index" ] && index=0

    info "Appending negative test case (@ index $index): ${arguments[*]}"

    sed -i '/# Negative test cases/s/$/\n    n'"$((++index))"') INPUT="'"${arguments[*]}"'" \&\& OUTPUT="'"$output\""';;/' "$file"
}

append_positive_test_case_with_output(){
    # $1 - test.sh
    # $2 - expected output
    # rest - arguments

    local file="$1"; shift
    local output="$1"; shift
    local arguments=( "${@}" )

    index="$(grep -E '\s*p[0-9]+\)' "$file" | head -n 1 | grep -oP '(?<=p).*?(?=\))' | head -n 1)"
    [ -z "$index" ] && index=0

    info "Appending positive test case (@ index $index): ${arguments[*]}"

    sed -i '/# Positive test cases/s/$/\n    p'"$((++index))"') INPUT="'"${arguments[*]}"'" \&\& OUTPUT="'"$output\""';;/' "$file"
}

extract_val_from_counter_example(){
    # $1 - Output from termination prover with counter example
    # $2 - Source code
    local output_file="$1"
    local code_file="$2"

    declare -A variables

    grep -q "^\s*VAL\s*\[.*\]$" "$output_file" || exit 1;

    # Extract from counter example variables that end up not terminating
    while IFS="=" read -r name var; do
        variables[$name]=$var
    done <<< "$(grep "^\s*VAL\s*\[.*\]$" "$output_file" \
                     | sed -n 1p \
                     | sed 's/.*\[//;s/\[//g;s/\]//g;s/\s*//g' \
                     | tr ',' '\n')"

    local args=()

    while IFS= read -r arg; do
        args+=( "${variables[$arg]}" )
    done <<< "$(grep -F '__VERIFIER_nondet_int()' "$code_file" \
                    | sed 's/int//g;s/\s*=\s*__VERIFIER.*$//g;s/\s//g')"

    printf "%s" "${args[*]}"
}
