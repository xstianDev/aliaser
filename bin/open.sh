#!/bin/bash

# open.sh - Opens the alias file in a text editor
# Parameters:
#   $1 - Name of the alias

source "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

if [[ -f $content ]]; then
    nano "$content"
else
    nano "$DYNALIAS_ALIAS/text/$1"
fi