export EDITOR=nvim
export VISUAL=nvim

# Export PATH without repetitions
export -U PATH="$HOME/.local/bin${PATH:+:}$PATH"
export -U PATH="$HOME/.config/guix/current/bin${PATH:+:}$PATH"
export -U PATH="/usr/local/sbin${PATH:+:}$PATH"
export -U PATH="/usr/bin${PATH:+:}$PATH"
export -U PATH="/usr/local/sbin:/usr/local/bin${PATH:+:}$PATH"

# Necessary for fenics to work
export PYTHONPATH="/usr/lib/python3.7/site-packages/:/usr/lib/python3.8/site-packages/"

if [[ -d "$HOME/.gem/ruby" ]]; then
    export -U PATH=$(echo "$HOME/.gem/ruby/"*"/bin")"${PATH:+:}$PATH"
fi

# Python startup file
[[ -f "$HOME/.pythonrc" ]] && export PYTHONSTARTUP="$HOME/.pythonrc"

# Source guix profile
guix_profile=$HOME/.guix-env
[[ -f $guix_profile ]] && . $guix_profile
