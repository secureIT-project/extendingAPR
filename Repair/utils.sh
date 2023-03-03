#!/bin/bash

die() {
    printf "[CRITICAL ERROR] %b\n" "$@" >&2
    exit 1
}

info(){
    printf "[INFO] %b\n" "$@" 2>&1
}

preprocess() {
    # $1 - Input.c
    # $2 - Output.i

    gcc -E "$1" > "$2"
}

