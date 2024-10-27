#!/bin/bash

# help.sh - Displays the help message of the command.

cat << EOF
Usage: dynalias OPTION [...ARGS]

Description: 
    Manages dynamic aliases to simplify shell commands.

Options:
    -h, --help          Displays this help message.

    -i, --init          Initializes the 'dynalias' directory structure.

    -u, --update        Processes the files in the 'dynalias' folder and formats the 'output' file.

    -l, --list          Lists all available aliases by echoing the contents of the 'output' file.

    -r, --read [name]   Reads the contents of an alias and displays it.

    -o, --open [name]   Opens the alias file in a text editor.
EOF