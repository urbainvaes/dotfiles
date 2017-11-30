export PATH="${PATH}:$HOME/bin:/usr/lib/surfraw"
export EDITOR=vim
export HISTSIZE=1000000


# source /home/urbain/.nix-profile/etc/profile.d/nix.sh

# Guix stuff
export PATH="/home/urbain/.guix-profile/bin${PATH:+:}$PATH"
export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale
export GUIX_PACKAGE_PATH=$HOME/Dropbox/projects/guix-packages
export GUILE_LOAD_PATH=$HOME/.guix-profile/share/guile/site/2.2:$GUILE_LOAD_PATH
export GUILE_LOAD_COMPILED_PATH=$HOME/.guix-profile/lib/guile/2.2/site-ccache:$GUILE_LOAD_COMPILED_PATH
export CPATH="/home/urbain/.guix-profile/include${CPATH:+:}$CPATH"
export LIBRARY_PATH="/home/urbain/.guix-profile/lib${LIBRARY_PATH:+:}$LIBRARY_PATH"

# Source configuration files
source "$HOME/.zsh/plugins"
source "$HOME/.zsh/functions"
source "$HOME/.zsh/alias"

# Custom key bindings for built-in widgets
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Export GPG-agent related
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
    source ${HOME}/.gpg-agent-info
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

PROMPT='%0~ $ '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Options
unsetopt histverify

# Use fzf with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
  zle && zle reset-prompt
}
zle     -N   z
bindkey '^z' z
