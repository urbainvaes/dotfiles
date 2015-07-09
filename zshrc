# Source antigen
source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode
antigen bundle ubuntu
antigen bundle tmux
antigen bundle rupa/z

# Theme
antigen theme eastwood

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Editor
export EDITOR=/usr/bin/nvim

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
alias light='xrdb ~/.Xresources.light'
alias dark='xrdb ~/.Xresources.dark'

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

# Fix smart search history
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

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

# Set programmer dvorak
# xrdb ~/.Xresources

TERM=xterm-256color

if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
    case $(tmux showenv TERM 2>/dev/null) in
        *256color) ;&
        TERM=fbterm)
            TERM=screen-256color ;;
        *)
            TERM=screen
    esac
fi

# Load external scripts
source ~/github/fzf-marks/fzf-marks.zsh
