#!/bin/bash

# open.sh - Opens the alias file in a text editor
# Parameters:
#   $1 - Name of the alias

source "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

if [[ -z $content || "$content" =~ "error" ]]; then
    err 1 "alias doesn't exist"
fi

if [[ -f $content ]]; then
    nano "$content"
else
    nano "$DYNALIAS_ALIAS/text/$1"
fi