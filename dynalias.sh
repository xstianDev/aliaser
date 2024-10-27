#!/bin/bash

# TODO ver si hay que mover la ejecución del comando arriba de 
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

if [[ -z "$1" ]]; then
    echo "Must provide a flag to use"
    echo "Try 'dynalias --help' for more information."
    exit 1
fi
    
if [[ ! -d "$HOME/dynalias" ]]; then
    echo "The 'dynalias' folder is not created. Use 'dynalias' --init to create it."
    echo "Try 'dynalias --help' for more information."
    exit 1
fi

if [[ "$1" == "-i" || "$1" == "--init" ]]; then
    source "$DYNALIAS_ROOT/bin/init.sh"
    exit 0
fi

export DYNALIAS_HOME="$HOME/dynalias"

export DYNALIAS_ALIAS="$DYNALIAS_HOME/alias"
export DYNALIAS_OUTPUT="$DYNALIAS_HOME/output"

export DYNALIAS_BIN="$DYNALIAS_ROOT/bin"
export DYNALIAS_LIB="$DYNALIAS_ROOT/lib"

source "$DYNALIAS_LIB/error.sh"

case "$1" in
    -h|--help)
        source "$DYNALIAS_BIN/help.sh"
        ;;
    -u|--update)
        source "$DYNALIAS_BIN/update.sh"
        ;;
    -l|--list)
        source "$DYNALIAS_BIN/list.sh"
        ;;
    -r|--read)
        args=("${@:2}")

        if [[ -z "${args[*]}" ]]; then
            err 1 "should pass an alias name to read from"
        fi

        source "$DYNALIAS_BIN/read.sh" "${args[@]}"
        ;;
    -o|--open)
        args=("${@:2}")

        if [[ -z "${args[*]}" ]]; then
            err 1 "should pass a name to open"
        fi

        source "$DYNALIAS_BIN/open.sh" "${args[@]}"
        ;;
    *)
        err 1 "unknown command $1, use -h or --help"
        ;;
esac

exit 0