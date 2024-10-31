# dynalias

## About
`dynalias` is a tool designed to simplify the creation and management of
Bash aliases by creating a new concept: dynamic aliases.

Traditional aliases get deleted after the shell session is over, 
but dynamic aliases persist across sessions and can be updated at any time.


## Install
To install `dynalias`:
```sh
export DYNALIAS_ROOT="$HOME/.dynalias" && (
    git clone https://github.com/keruDev/dynalias.git "$DYNALIAS_ROOT"
    . "$DYNALIAS_ROOT/bin/init.sh"  # initializes dynalias directories
)
```

Then paste the following on `~/.bashrc` (before the `.bash_aliases` execution):
```sh
# dynalias
export DYNALIAS_ROOT="$HOME/.dynalias"
alias dynalias="$DYNALIAS_ROOT/dynalias.sh"
#dynalias -s  # uncomment to update aliases when opening console

# This should exist by default. If not, paste the whole thing
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```


## How to use
If you executed the `init.sh` script during installation, you should have see the `dynalias` folder in your home directory.

Inside, you will find two key elements:
- The `alias` directory, which contains the `text` and `func` subdirectories (more on them below). 
- The `output` file, which stores the output after running `dynalias`.

### `text` aliases
Simple aliases that don't accept arguments. An example of a `text` alias:
```sh
# text/add
git add .
```

After formatting, `text` aliases are stored as raw text:
```sh
# output
alias add='git add .'
```

After running `dynalias`, you can use: 
```sh
add   # This executes 'git add .'
```

### `func` aliases
Aliases that require arguments. An example of a `func` alias:
```sh
# func/commit

#!/bin/bash

commit() {
    if [[ -z $1 ]]; then
        echo "Provide a commit message"
        exit 1
    fi

    git commit -m "$1"
}

commit "$@"  # Use "$@" to spread all args
```

After formatting, `func` aliases are stored as a path to their file:
```sh
# output
alias commit='/your/home/path/dynalias/alias/func/commit'
```

After running `dynalias`, you can use: 
```sh
commit "Initial commit"   # This executes 'git commit -m "Initial commit"'
```

If you forgot the commit message:
```sh
commit
Provide a commit message
```