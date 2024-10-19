#!/bin/bash

# Description: Checks if a file is a file, directory or other.
# Parameters:
#   $1 - Path of the file
# Returns: Message that outputs the type of file
assert_equals() {
    result=$1
    expected=$2


    # Verifica si la salida es la esperada
    if [ "$result" == "$expected" ]; then
        echo "OK"
    else
        echo "Error"
    fi
}