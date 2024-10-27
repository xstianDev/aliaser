#!/bin/bash

# list.sh - Echoes the contents of the 'output' file

content=$(cat "$DYNALIAS_OUTPUT")

if [[ -z $content ]]; then
    err 1 "output file has no content"
fi

echo "$content"