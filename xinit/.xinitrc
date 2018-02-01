#!/bin/bash

# Pulse audio
/usr/bin/start-pulseaudio-x11

# Load key bindings
$HOME/bin/keyboard

# Load Xresources to light colorscheme
source $HOME/.local/share/zsh/colors.zsh
xrdb $HOME/.Xresources/$XRESOURCE

# Background
feh --bg-fill /home/urbain/documents/wallpapers/pagoda.jpg

# Synchronise primary and clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Disable screen going blank
xset -dpms
xset s off

# SSH agent
eval $(ssh-agent)

# Programs to start
nm-applet &
dropbox &
dunst &
redshift &

exec i3
