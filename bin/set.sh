#!/bin/bash

# set.sh - Reads the alias files and formats them into lines to update the output file.
# Parameters:
#   $1 - Type of alias (text or func)

source "$DYNALIAS_LIB/alias.sh"
source "$DYNALIAS_LIB/output.sh"

if [[ -n "$1" ]]; then
    if [[ "$1" == "text" || "$1" == "func" ]]; then
        cd "$DYNALIAS_ALIAS/$1"
        nano || exit
        cd "$DYNALIAS_ROOT"
    else
        err 1 "unknown alias type; must be 'text' or 'func'"
    fi
fi

check_output

for dir in "$DYNALIAS_ALIAS"/*
do
    if [[ -z "$(ls -A "$dir")" ]]; then
        err 0 "$dir is empty; can't create aliases from this directory"
        continue
    fi

    type="${dir#"$DYNALIAS_ALIAS"/}"

    write_output "# $type"

    for file in "$dir"/*
    do  
        write_output "$(format_alias "$type" "$file")"
    done

    write_output ""
done
