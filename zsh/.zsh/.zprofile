export EDITOR=vim
export HISTSIZE=1000000

# Start X automatically
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
