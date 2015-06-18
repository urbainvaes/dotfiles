# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="eastwood"

# Enable correction
ENABLE_CORRECTION="true"

# Dots for completion
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(vi-mode git ubuntu)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

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
alias e=$EDITOR
alias g='git'
alias gco='git checkout'
alias install='sudo apt-get install'
alias m='mutt'
alias mail='offlineimap -u quiet &'
alias mc='make clean'
alias mn="$EDITOR ~/.mynotes"
alias n='nvim'
alias ns="$EDITOR --servername SYNC"
alias nsess="$EDITOR -S Session.vim"
alias pull='git pull origin master'
alias purge='sudo apt-get purge'
alias push='git push origin master'
alias pushs='git push --recurse-submodules=check'
alias remove='sudo apt-get autoremove'
alias tmux="TERM=screen-256color-bce tmux"
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias v='vim'
alias x='sh ~/.xmodmap'

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

# Crontab jobs
crontab ~/.crontab

TERM=xterm-256color


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
source ~/github/fzf-marks/fzf-marks.zsh
source ~/github/z/z.sh
source ~/github/fzf-extras/fzf-extras.sh
source ~/github/fzf-extras/fzf-extras.zsh
xrdb ~/.Xressources
