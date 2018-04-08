export EDITOR=nvim
export VISUAL=nvim

# Source guix & nix profiles
guix_profile=$HOME/.guix-env
nix_profile=$HOME/.nix-profile/etc/profile.d/nix.sh

[[ -f $guix_profile ]] && . $guix_profile
[[ -f $nix_profile ]] && . $nix_profile

# Export PATH without repetitions
export -U PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:/usr/lib/surfraw${PATH:+:}$PATH"
