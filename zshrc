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
export EDITOR=/usr/bin/vim

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Apps for filetypes
alias -s vim=vim
alias -s cpp=vim
alias -s c=vim
alias -s tex=vim
alias -s pdf=zathura
alias -s py=vim

# Directories
alias u='cd ~/Dropbox/phd'
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
alias v=$EDITOR
alias g='git'
alias v='vim'
alias n='nvim'
alias vs="vim --servername SYNC"
alias vsess="vim -S Session.vim"
alias va="vim --servername SYNC main.tex \
                                sections/introduction.tex \
                                sections/sec1.tex \
                                sections/sec2.tex \
                                sections/sec3.tex \
                                sections/conclusion.tex"
alias c='clear'
alias m='mutt'
alias a='vifm'
alias mn='vim ~/.mynotes'
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
alias ez='vim ~/.zshrc'
alias em='vim ~/.mutt/muttrc'
alias ev='vim ~/.vimrc'
alias eza='vim ~/.zathurarc'
alias et='vim ~/.tmux.conf'
alias evi='vim ~/.vifm/vifmrc'
alias eo='vim ~/.offlineimaprc'
alias ex='vim ~/.xmodmap'

# Fix smart search history
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward

# Crontab jobs
crontab ~/.crontab
