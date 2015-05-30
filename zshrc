# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="eastwood"

# Enable correction
ENABLE_CORRECTION="true"

# Dots for completion
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(vi-mode git)

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
alias u='cd ~/Dropbox/phd/papers/spectral/code/finite'
alias uc='cd ~/Dropbox/phd/programs'
alias ul='cd ~/Dropbox/phd/literature'
alias ur='cd ~/Dropbox/phd/reports'
alias up='cd ~/Dropbox/phd/presentations'
alias papers='cd ~/Dropbox/phd/papers'
alias books='cd ~/Dropbox/phd/books'
alias cdd='cd ~/dotfiles'

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
alias remove='sudo apt-get autoremove'
alias tmux="TERM=screen-256color-bce tmux"
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias v='vim'
alias x='sh ~/.xmodmap'

# Configuration
alias ez="$EDITOR ~/.zshrc"
alias em="$EDITOR ~/.mutt/muttrc"
alias ev="$EDITOR ~/.vimrc"
alias en="$EDITOR ~/.nvimrc"
alias eza="$EDITOR ~/.zathurarc"
alias et="$EDITOR ~/.tmux.conf"
alias evi="$EDITOR ~/.vifm/vifmrc"
alias eo="$EDITOR ~/.offlineimaprc"
alias ex="$EDITOR ~/.xmodmap"

# Fix smart search history
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward

# Crontab jobs
crontab ~/.crontab

TERM=xterm-256color
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
