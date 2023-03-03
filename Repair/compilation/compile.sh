#!/bin/bash
#

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. "$SCRIPT_DIR/template.sh"

# Variables
exe_name="$1"
code_file="$2"
shift;shift;

tmpfile="$(mktemp /tmp/APR.XXXXXXXXXXXXX.c)"
# TODO: following line used for debugging purposes only
# tmpfile="$(dirname "$code_file")/full_code2.c"
printf "%s" "$(apply_template "$code_file")" > "$tmpfile"

options=( "-g" )

if [ "$(basename "$(dirname "$(realpath "$code_file")")")" != "coverage" ]; then
    options+=( "-Wuninitialized" "-Werror" )
fi

gcc -O0 -o "$exe_name" "$tmpfile" "${options[@]}" $@
status=$?

exit $status
