#!/bin/bash

test_is_file() {
    path=$1

    if [[ -d $path ]]; then
        echo "$path is a directory"
    elif [[ -f $path ]]; then
        echo "$path is a file"
    else
        echo "$path is not valid"
        exit 1
    fi
}

test_create_file() {
    path=$1

    touch "$path"
    echo "#!/bin/bash" >> "$path"
}

test_check_file() {
    path=$1

    if [ ! -f "$path" ]; then
        create_file "$path"
    fi
}

test_write_file() {
    path=$1
    content=$2

    check_file "$path"
    echo "$content" >> "$path"
}