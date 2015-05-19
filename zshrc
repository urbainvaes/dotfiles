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
alias -s py=$EDITOR

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
alias tmux="TERM=screen-256color-bce tmux"
alias g='git'
alias v='vim'
alias n='nvim'
alias e=$EDITOR
alias vs="$EDITOR --servername SYNC"
alias vsess="$EDITOR -S Session.vim"
alias va="$EDITOR --servername SYNC main.tex \
                                sections/introduction.tex \
                                sections/sec1.tex \
                                sections/sec2.tex \
                                sections/sec3.tex \
                                sections/conclusion.tex"
alias c='clear'
alias mc='make clean'
alias m='mutt'
alias a='vifm'
alias mn="$EDITOR ~/.mynotes"
alias x='sh ~/.xmodmap'
alias mail='offlineimap -u quiet &'
alias ca='printf "\ec"'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get autoremove'
alias purge='sudo apt-get purge'
alias push='git push origin master'
alias pull='git pull origin master'
alias commit='git commit -a -m'
alias gco='git checkout'

# Configuration
alias ez="$EDITOR ~/.zshrc"
alias em="$EDITOR ~/.mutt/muttrc"
alias ev="$EDITOR ~/.vimrc"
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
