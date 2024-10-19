# dynalias
A project that aims simplify aliasing.


## Architecture

To set the aliases, execute setup.sh

If you want to make your own aliases, create a .sh file called like its alias.
For example, if your alias will be called "commit", you'll need to name your file "commit.sh".

    chmod +x setup.sh

When to use `refresh.sh`:
- After cloning the repository. This will set an alias to the `setup.sh` entrypoint automatically.
- After moving `setup.sh`. This is because `refresh.sh` calls `setup.sh` from the directory where it was before moving.