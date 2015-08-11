#!/bin/bash

# Key repeat rate
xset r rate 400 50

# Load key bindings
$HOME/bin/keyboard.sh

# Load Xresources to light colorscheme
xrdb $HOME/.Xresources/dark

# Start gpg-agent
killall -9 gpg-agent

gpg-agent --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info"
