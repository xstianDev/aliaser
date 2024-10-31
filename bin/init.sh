#!/bin/bash

# init.sh - Creates the basic structure where dynalias will look for the aliases and output files.

DYNALIAS="$HOME/dynalias"

if [[ ! -d "$DYNALIAS" ]]; then
    mkdir -p "$DYNALIAS/alias/text" "$DYNALIAS/alias/func"
    touch "$DYNALIAS/output"
fi

line="[ -f \"$DYNALIAS/output\" ] && source \"$DYNALIAS/output\""
if [[ ! -f ~/.bash_aliases || -z $(grep -F "$line" ~/.bash_aliases) ]]; then
    echo "$line" >> ~/.bash_aliases
fi
