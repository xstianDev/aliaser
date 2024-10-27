#!/bin/bash

# update.sh - Reads the alias files and formats them into lines to update the output file.

source "$DYNALIAS_LIB/alias.sh"
source "$DYNALIAS_LIB/output.sh"

check_output

for dir in "$DYNALIAS_ALIAS"/*
do
    if [ -z "$(ls -A "$dir")" ]; then
        err 0 "$dir is empty; can't create aliases from this directory"
        continue
    fi

    mode="${dir#"$DYNALIAS_ALIAS"/}"

    write_output "# $mode"

    for file in "$dir"/*
    do  
        write_output "$(format_alias "$mode" "$file")"
    done

    write_output ""
done