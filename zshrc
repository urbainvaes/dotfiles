ZSH_PLUGINS="$HOME/.zsh/zsh-plugins"
ZSH_ALIASES="$HOME/.zsh/zsh-aliases"
ZSH_TMP="$HOME/.zsh/zsh-tmp"

# Source configurations
source $ZSH_PLUGINS
source $ZSH_ALIASES
source $ZSH_TMP

# Custom key bindings for built-in widgets
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Paths of executables
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:\
    /usr/bin:/sbin:/bin:/usr/games:/usr/local/games:\
    /home/urbain/bin"

# Editor
export EDITOR=/usr/bin/nvim

fshow() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
        --bind 'ctrl-m:execute:
    echo {} | grep -o "[a-f0-9]\{7\}" |
    xargs -I % sh -c "git show --color=always % | less -R"'
}

function colo {

# Change colors for current session
$HOME/.bin/recolor.sh < ~/.Xresources/Xresources.$1

# Load Xresources file for future sessions
xrdb ~/.Xresources/Xresources.$1

# Change environment variable
export COLORSCHEME=light

# Change default environment variable for future sessions
sed -i --follow-symlinks "s/^export COLORSCHEME=.*$/export COLORSCHEME=$1/g" ~/dotfiles/zshrc
}

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
    source /home/urbain/.gpg-agent-info
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
