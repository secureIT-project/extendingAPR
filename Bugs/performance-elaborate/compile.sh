#!/bin/bash
exe_name="$1"
code_file="$2"
shift;shift;

options=( )

if [ "$(basename "$(dirname "$(realpath "$code_file")")")" != "coverage" ]; then
    options+=( "-Wuninitialized" "-Werror" )
fi

gcc "$code_file" -O0 -o "$exe_name" "${options[@]}" $@
status=$?

exit $status
