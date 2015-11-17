#!/bin/bash

# Key repeat rate
xset r rate 400 50

# Load key bindings
$HOME/bin/keyboard

# Load Xresources to light colorscheme
xrdb $HOME/.Xresources/light

# Background
feh --bg-fill --randomize /usr/share/backgrounds

# Synchronise primary and clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Disable screen going blank
xset -dpms
xset s off

# Programs to start
nm-applet &
dropbox &

exec i3
