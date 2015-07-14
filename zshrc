# Load zgen
source "/home/urbain/.zgen/zgen.zsh"

if ! zgen saved; then

    echo "Creating a zgen save"

    # Load oh-my-zsh framework
    zgen oh-my-zsh

    # Oh-my-zsh plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/ubuntu
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/themes

    # zsh-users plugins
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting

    # Appearance
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure
    # zgen oh-my-zsh themes/eastwood

    # My plugins
    zgen load uvaes/fzf-marks
    zgen load uvaes/grm

    # Other plugins
    zgen load rupa/z
    zgen load djui/alias-tips
    zgen load tarruda/zsh-autosuggestions
    zgen load Tarrasch/zsh-autoenv
    zgen load joel-porquet/zsh-dircolors-solarized

    # Save all to init script
    zgen save
fi

# Custom key bindings for widgets
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^y' autosuggest-execute-suggestion

# Environment variables for plugins
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=6'
REPOFILE=/home/urbain/dotfiles/repos.zsh


# Autosuggestion
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# Repofile

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Editor
export EDITOR=/usr/bin/nvim

# Apps for filetypes
alias -s vim=$EDITOR
alias -s cpp=$EDITOR
alias -s c=$EDITOR
alias -s tex=$EDITOR
alias -s pdf=zathura

# Directories
alias books='cd ~/Dropbox/phd/books'
alias cdd='cd ~/dotfiles'
alias papers='cd ~/Dropbox/phd/papers'
alias report='cd ~/Dropbox/phd/reports/9\ months'
alias u='cd ~/Dropbox/phd'
alias uc='cd ~/Dropbox/phd/programs'
alias ul='cd ~/Dropbox/phd/literature'
alias up='cd ~/Dropbox/phd/presentations'
alias ur='cd ~/Dropbox/phd/reports'

# Commands
alias a='vifm'
alias c='clear'
alias ca='printf "\ec"'
alias commit='git commit -a -m'
alias g='git'
alias install='sudo apt-get install'
alias m='mutt'
alias mail='offlineimap -u quiet &'
alias mc='make clean'
alias mca='make clean-all'
alias n='nvim'
alias ns="$EDITOR -S Session.vim"
alias pull='git pull origin master'
alias push='git push origin master'
alias pushs='git push --recurse-submodules=check'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias v='vim'
alias x='sh ~/.xmodmap'
alias xcape='/home/urbain/xcape/xcape'

# Configuration
alias em="$EDITOR ~/.mutt/muttrc"
alias en="$EDITOR ~/.nvimrc"
alias eo="$EDITOR ~/.offlineimaprc"
alias et="$EDITOR ~/.tmux.conf"
alias ev="$EDITOR ~/.vimrc"
alias evi="$EDITOR ~/.vifm/vifmrc"
alias ex="$EDITOR ~/.xmodmap"
alias ez="$EDITOR ~/.zshrc"
alias eza="$EDITOR ~/.zathurarc"

# Tmux
alias son="tmux set -g status on"
alias soff="tmux set -g status off"


# Crontab jobs
crontab ~/.crontab


fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

fshow() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
        --bind 'ctrl-m:execute:
    echo {} | grep -o "[a-f0-9]\{7\}" |
    xargs -I % sh -c "git show --color=always % | less -R"'
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
    case $(tmux showenv TERM 2>/dev/null) in
        *256color) ;&
        TERM=fbterm)
            TERM=screen-256color ;;
        *)
            TERM=screen
    esac
fi


# Colors
# export TERM=xterm-256color
export COLORSCHEME=dark

function colo {

    # Change colors for current session
    $HOME/.bin/recolor.sh < ~/.Xresources.$1

    # Load Xresources file for future sessions
    xrdb ~/.Xresources.$1

    # Change environment variable
    export COLORSCHEME=$1

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


# Z
unalias z 2> /dev/null
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf-tmux +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _z "$@"
  fi
}
