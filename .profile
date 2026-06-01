# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# Note: I, mrpandey, has decided to load .profile in .bashrc. Go check it.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# include .bashrc if it exists and we aren't already looping
if [ -n "$BASH_VERSION" ] && [ -z "$_LOADING_PROFILE" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        _LOADING_PROFILE=1  # Turn on the circuit breaker
        . "$HOME/.bashrc"
        unset _LOADING_PROFILE # Turn it off when completely done
    fi
fi

# append to PATH if directory exists and not already in PATH
append_to_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}

append_to_path "$HOME/bin"
append_to_path "$HOME/.local/bin"
append_to_path "/opt/mssql-tools18/bin"

# include cargo env if it exists
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# set GOROOT if go is installed
#if [ -d "/usr/local/go" ]; then
#    export GOROOT="/usr/local/go"
#    PATH="$PATH:$GOROOT/bin"
#fi

# set GOPATH
if [ -d "$HOME/.go" ]; then
    export GOPATH="$HOME/.go"
    append_to_path "/usr/local/go/bin"
    append_to_path "$GOPATH/bin"
    #PATH="$PATH:/usr/local/go/bin"
    #PATH="$PATH:$GOPATH/bin"
fi

export XDG_CURRENT_DESKTOP="${XDG_CURRENT_DESKTOP:-sway}"
export MOZ_ENABLE_WAYLAND=1
export PATH
