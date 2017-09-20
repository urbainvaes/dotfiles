export PATH="${PATH}:$HOME/bin:/usr/lib/surfraw"
export EDITOR=vim

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
