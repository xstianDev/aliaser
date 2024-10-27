#!/bin/bash

# read.sh - Echoes the contents of the alias file
# Parameters:
#   $1 - Name of the alias

source "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

if [[ -f $content ]]; then
    cat "$content"; echo
else
    echo "$content"
fi