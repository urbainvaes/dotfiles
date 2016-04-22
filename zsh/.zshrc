# Write tmp file if it doesn't exist
[[ ! -f ~/.zsh/tmp ]] && echo "export COLORSCHEME=dark" > ~/.zsh/tmp

# Source configuration files
source "$HOME/.zsh/plugins"
source "$HOME/.zsh/functions"
source "$HOME/.zsh/alias"

# Custom key bindings for built-in widgets
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Paths of executables
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/core_perl:$HOME/bin"

# Editor
export EDITOR=/usr/bin/nvim

# Fix tmux colors
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
    case $(tmux showenv TERM 2>/dev/null) in
        *256color) ;&
        TERM=fbterm)
            TERM=screen-256color ;;
        *)
            TERM=screen
    esac
fi

# Export GPG-agent related
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
    source ${HOME}/.gpg-agent-info
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi


# Tmux colors fix
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
    case $(tmux showenv TERM 2>/dev/null) in
        *256color) ;&
        TERM=fbterm)
            TERM=screen-256color ;;
        *)
            TERM=screen
    esac
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
