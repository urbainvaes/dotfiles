export EDITOR=nvim
export VISUAL=nvim

# Export PATH without repetitions
export -U PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin${PATH:+:}$PATH"
export PATH="/home/urbain/.config/guix/current/bin${PATH:+:}$PATH"

# Python startup file
[[ -f "$HOME/.pythonrc" ]] && export PYTHONSTARTUP="$HOME/.pythonrc"

# Source guix profile
guix_profile=$HOME/.guix-env
[[ -f $guix_profile ]] && . $guix_profile

