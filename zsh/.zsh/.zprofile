export EDITOR=nvim
export VISUAL=nvim
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# Start X automatically
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
