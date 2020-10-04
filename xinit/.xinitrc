#!/bin/bash

# Pulse audio
/usr/bin/start-pulseaudio-x11

# Load key bindings
$HOME/.local/bin/keyboard

# Load Xresources to light colorscheme
source $HOME/.local/colors.zsh
xrdb $HOME/.Xresources/$COLORSCHEME

# Background
feh --bg-fill /usr/share/backgrounds/More_Kamikochi_by_mendhak.jpg
# feh --bg-fill /usr/share/backgrounds/Grand_Canyon_North_Rim_by_Rihards_Vilks.jpg

# Disable screen going to sleep
xset -dpms
xset s off

# Disable bell
xset -b

# SSH agent
eval $(ssh-agent)

# Programs to start
nm-applet &
dunst &
redshift &

exec i3
