export EDITOR=vim
export HISTSIZE=1000000

# We need to reset $PATH because /etc/profile is read after ~/.zshenv
export PATH="$HOME/bin:$HOME/.guix-profile/bin:$HOME/bin:/usr/lib/surfraw${PATH:+:}$PATH"

# Start X automatically
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
