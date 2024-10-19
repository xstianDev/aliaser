#!/bin/bash

# dirs
BASE_DIR=$(dirname "$(realpath "$0")")
SRC_DIR=$BASE_DIR/src
ALIAS_DIR=$BASE_DIR/alias
FN_DIR=$BASE_DIR/fn

# imports
source "refresh.sh" "$SRC_DIR"
source "$SRC_DIR/alias.sh"

# normal aliases
# write_aliases "text" "$ALIAS_DIR"
write_aliases "func" "$FN_DIR"