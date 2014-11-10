# Key remapping

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=/usr/bin/vim

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias -s vim=vim
alias -s cpp=vim
alias -s c=vim
alias -s tex=vim
alias -s pdf=zathura
alias -s py=vim

alias tmux="TERM=screen-256color-bce tmux"
alias g='git'
alias v=$EDITOR
alias u='cd ~/Dropbox/phd'
alias uc='cd ~/Dropbox/phd/programs'
alias up='cd ~/Dropbox/phd/presentations'
alias ul='cd ~/Dropbox/phd/literature'
alias ur='cd ~/Dropbox/phd/reports'
alias cdd='cd ~/dotfiles'
alias c='clear'
alias m='mutt'
alias a='vifm'
alias mn='vim ~/.mynotes'
alias x='sh ~/.xmodmap'
alias mail='offlineimap'
# alias clear='print "\ec"'

# Configuration
alias zconf='vim ~/.zshrc'
alias mconf='vim ~/.mutt/muttrc'
alias vconf='vim ~/.vim/vimrc'
alias zaconf='vim ~/.zathurarc'
alias tconf='vim ~/.tmux.conf'
alias viconf='vim ~/.vifm/vifmrc'
alias oconf='vim ~/.offlineimaprc'
alias xconf='vim ~/.xmodmap'

# Fix smart search history
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward

# Colorscheme
sleep 2
h=`date +%H`
if [ $h -lt 9 ]; then
    xdotool key Alt+t p Down Return
    eval `dircolors ~/.solarized/dircolors-solarized/dircolors.ansi-dark`
elif [ $h -lt 17 ]; then
    xdotool key Alt+t p Down Down Return
    eval `dircolors ~/.solarized/dircolors-solarized/dircolors.ansi-light`
else
    xdotool key Alt+t p Down Return
    eval `dircolors ~/.solarized/dircolors-solarized/dircolors.ansi-dark`
fi

# Crontab jobs
crontab ~/dotfiles/crontab
