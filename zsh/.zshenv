export EDITOR=nvim
export VISUAL=nvim

# Export PATH without repetitions
export -U PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:/usr/lib/surfraw${PATH:+:}$PATH"

# Python startup file
export PYTHONSTARTUP="$HOME/.pythonrc"

# Source guix profile
guix_profile=$HOME/.guix-env

[[ -f $guix_profile ]] && . $guix_profile

