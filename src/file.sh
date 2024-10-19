#!/bin/bash

# Description: Checks if a file is a file, directory or other.
# Parameters:
#   $1 - Path of the file
# Returns: Message that outputs the type of file
is_file() {
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

# Description: Reads files from a directory, taking their name and contents, and using them as the alias' values.
# Parameters:
#   $1 - Path of the file
#   $2 - Prefix for aliases names
#   $3 - Where the aliases will be written
# Returns: None
create_file() {
    path=$1

    touch "$path"
    # echo "#!/bin/bash" >> "$path"
}

# Description: Checks if a file is created. If it's not, it creates the file.
# Parameters:
#   $1 - Path of the file
# Returns: None
check_file() {
    path=$1

    if [ ! -f "$path" ]; then
        create_file "$path"
    fi
}

# Description: Writes content into a file.
# Parameters:
#   $1 - Path of the file
#   $2 - Content to be written
# Returns: None
write_file() {
    path=$1
    content=$2

    check_file "$path"
    echo "$content" >> "$path"
}