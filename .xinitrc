#!/bin/bash

# Key repeat rate
xset r rate 400 50

# Load key bindings
$HOME/bin/keyboard

# Load Xresources to dark colorscheme
xrdb $HOME/.Xresources/dark

# Start gpg-agent
killall -9 gpg-agent

gpg-agent --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info"

feh --bg-fill --randomize /usr/share/backgrounds

# Synchronise primary and clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

exec i3
