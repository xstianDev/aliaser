#!/bin/bash

# help.sh - Displays the help message of the command.

cat << EOF
Usage: dynalias OPTION [...ARGS]

Description: 
    Manages dynamic aliases to simplify shell commands.

Options:
    -h, --help          Displays this help message.

    -i, --init          Initializes the 'dynalias' directory structure.

    -l, --list          Shows the lines of the 'output' file.

    -s, --set  [type]   If a type is passed, creates a new alias and updates the existing ones.
                        If not, just updates the output.

    -r, --read [name]   Reads the contents of an alias and displays it.

    -o, --open [name]   Opens the alias file in a text editor.
EOF