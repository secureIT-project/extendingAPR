#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TEMPLATE_FILE="$SCRIPT_DIR/template.c"

get_template(){
    local template_name="$1"

    start="$(grep -nF "/* START_TEMPLATE: $template_name */" \
                  "$TEMPLATE_FILE" | cut -d ":" -f1)"
    end="$(grep -nF "/* END_TEMPLATE: $template_name */" \
                  "$TEMPLATE_FILE" | cut -d ":" -f1)"

    sed -n $((start+1)),$((end-1))p "$TEMPLATE_FILE"
}

apply_template(){
    code_file="$1"
    
    code="$(cat "$code_file")"

    # Apply templates
    if grep -q "__VERIFIER_nondet_int()" "$code_file"; then
        code="${code/int main\(/int loop\(}"
        code="$(printf "%s\n\n\n%s" "$(get_template '__VERIFIER_nondet_int()')" "$code")"
        code="$(printf "%s\n\n\n%s" "$(get_template 'pre')" "$code")"
        code="$(printf "%s\n\n\n%s" "$code" "$(get_template 'post')")"
    fi;
    
    printf "%s" "$code"
}
