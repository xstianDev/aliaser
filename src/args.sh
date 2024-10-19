#!/bin/bash

# Description: Reads a default value and returns itself or an empty string if the default value is not passed.
# Parameters:
#   $1 - Default value passed
# Returns: Default value or empty string
__check_arg() {
    arg=$1

    if [ -z "$arg" ]; then
        echo ""
    else
        echo "$arg"
    fi
}

# Description: Reads an argument and returns a default value if the argument is empty.
# Parameters:
#   $1 - Argument passed
#   $2 - Default value if argument is empty
# Returns: Argument or its default value
get_arg() {
    passed=$1
    default=$2

    if [ -z "$passed" ]; then
        arg=$(__check_arg "$default")
        echo "$arg"
    else
        echo "$passed"
    fi
}