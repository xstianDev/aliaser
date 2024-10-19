#!/bin/bash

test_check_arg() {
    arg=$1

    if [ -z "$arg" ]; then
        echo ""
    else
        echo "$arg"
    fi
}

test_get_arg() {
    passed=$1
    default=$2

    # TODO lógica errónea (?)
    if [ -z "$passed" ]; then
        arg=$(check_arg "$default")
        echo "$arg"
    else
        echo "$passed"
    fi
}