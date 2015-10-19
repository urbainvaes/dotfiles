#!/bin/bash

# Key repeat rate
xset r rate 400 50

# Load key bindings
$HOME/bin/keyboard

# Load Xresources to dark colorscheme
xrdb $HOME/.Xresources/dark

# Background
feh --bg-fill --randomize /usr/share/backgrounds

# Synchronise primary and clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

exec i3
