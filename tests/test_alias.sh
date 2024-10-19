#!/bin/bash

test_format_alias() {
    dir=$1
    pre=$2

    name=${file#$dir}
    name=$pre$name

    code=$(cat "$file")

    echo "alias $name='$code'"
}

test_write_alias() {
    BASE_DIR=$(dirname "$(realpath "$0")")
    SRC_DIR=$BASE_DIR/src

    source "$SRC_DIR/args.sh"
    source "$SRC_DIR/file.sh"

    dir=$1
    pre=$(get_arg "$2")
    path=$(get_arg "$3" "$HOME/aliases/git_alias.sh")

    for file in "$dir"/*
    do
        alias=$(format_alias "$file" "$pre")
        check_file "$path"
        write_file "$path" "$alias"
    done
}