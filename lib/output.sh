#!/bin/bash

# output.sh - Contains utilities related to file management.

# Description: If a file is created, it gets emptied. If it's not, it creates the file.
# Parameters:
#   $1 - Path of the file
# Returns: Nothing
check_output() {
    if [[ -f "$DYNALIAS_OUTPUT" ]]; then
        truncate -s 0 "$DYNALIAS_OUTPUT"
    else
        touch "$DYNALIAS_OUTPUT"
    fi
}

# Description: Writes content into a file.
# Parameters:
#   $1 - Content to be written
# Returns: Nothing
write_output() {
    echo "$1" >> "$DYNALIAS_OUTPUT"
}