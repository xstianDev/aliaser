#!/bin/bash

# error.sh - Contains utilities related to error management.

# Description: Displays an error message
# Parameters:
#   $1 - 1 if it will exit, 0 if not
#   $2 - Error message
# Returns: Nothing
err() {
    RED='\033[0;31m'
    RESET='\033[0m'

    printf "${RED}error:${RESET} %s\n" "$2"

    if [[ "$1" == 1 ]]; then
        exit 1
    fi
}