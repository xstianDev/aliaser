#!/bin/bash

# Description: Reads a file, and extracts its name and contents to format the alias command.
# Parameters:
#   $1 - Kind of alias
#   $2 - File to be processed
#   $3 - File extension to be ignored
#   $4 - Prefix for aliases names
# Returns: Formatted alias command
__format_alias() {
    mode=$1
    file=$2
    ext=$3
    pre=$4

    name=${file#$ext}
    name=$pre$name

    if [[ $mode == "text" ]]; then
        code=$(cat "$file")
    elif [[ $mode == "func" ]]; then
        code="$file"
    else
        echo "Unknown mode"
        exit 1
    fi

    echo "alias $name='$code'"
}

# Description: Reads files from a directory, taking their name and contents, and using them as the alias' values.
# Parameters:
#   $1 - Kind of alias to set
#   $2 - Directory containing the files
#   $3 - Prefix for aliases names
#   $4 - Where the aliases will be written
# Returns: None
write_aliases() {
    BASE_DIR=$(dirname "$(realpath "$0")")
    SRC_DIR="$BASE_DIR/src"

    source "$SRC_DIR/args.sh"
    source "$SRC_DIR/file.sh"

    mode=$(get_arg "$1" "text")
    dir=$(get_arg "$2" "$HOME/dynalias")
    pre=$(get_arg "$3" "$dir/")
    path=$(get_arg "$4" "$ALIAS_PATH")

    for file in "$dir"/*
    do  
        alias=$(__format_alias "$mode" "$file" "$pre")
        check_file "$path"
        write_file "$path" "$alias"
    done
}