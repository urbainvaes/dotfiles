#!/bin/bash

# Key repeat rate
xset r rate 400 50

# Dvorak programer
setxkbmap us -variant dvp

# Load key bindings
$HOME/.xmodmap

# Set colorscheme to light
export COLORSCHEME=default

# Load Xresources to light colorscheme
xrdb $HOME/.Xresources.default
