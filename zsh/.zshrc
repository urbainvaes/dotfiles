## startx automatically {{{1
[[ -z $DISPLAY && -z $SSH_CONNECTION && $XDG_VTNR -eq 1 ]] && exec startx
## Bindings {{{1

# Load fzf bindings here because we will override ^r
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^?' backward-delete-char # backspace
bindkey '^n' history-beginning-search-forward
bindkey '^p' history-beginning-search-backward
bindkey '^a' beginning-of-line
bindkey '^b' backward-char
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^v' visual-mode
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^W' edit-command-line
## Options and modules {{{1

KEYTIMEOUT=1

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_ignore_space
setopt inc_append_history
setopt no_share_history
setopt interactivecomments

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Kill word
autoload -U select-word-style
select-word-style bash

# Prompt
if [[ -n $SSH_CONNECTION ]]; then
PROMPT='%F{red}[%M]%f %0~ $ '
else
PROMPT='%0~ $ '
fi

if [[ -n $VIFM ]]; then
PROMPT="%F{green}[VIFM]%f $PROMPT"
fi
# }}}
## Plugins {{{
[ ! -d ~/.zsh/zgen ] && git clone https://github.com/tarjoilija/zgen.git ~/.zsh/zgen
source "$HOME/.zsh/zgen/zgen.zsh"

FZF_MARKS_PLUGIN_ZSH=$HOME/dotfiles/plugins/fzf-marks/fzf-marks.plugin.zsh
[ -f "$FZF_MARKS_PLUGIN_ZSH" ] && source "$FZF_MARKS_PLUGIN_ZSH"
FZF_MARKS_COMMAND="$FZF_MARKS_COMMAND -e -n 1 -d ' : '"

if ! zgen saved; then
    echo "Creating a zgen save"
    zgen load rupa/z
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen save
fi

bindkey '^y' autosuggest-accept
bindkey '^z' z

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

## Use fzf with z {{{1

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
  zle && zle reset-prompt
}
zle -N z

## Aliases {{{1

# Directories
alias cdd='cd ~/dotfiles'
alias cdp='cd ~/personal'

# Vim
alias n='nvim'
alias ns='nvim -S Session.vim'
alias v='vim'
alias vs="vim -S Session.vim"

# Git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gr='git remote'
alias gra='git remote add'
alias gst='git status'
alias rd='cd $(git rev-parse --show-toplevel)'

# GNU Make
alias mi='make install'
alias mc='make clean'
alias mca='make clean-all'

# Misc
alias a='vifm . .'
alias m='cd ~/.mutt/attachments && mutt && cd -'
alias e='nvim'
alias f='fzm'
alias mux='tmuxinator'
alias email='mbsync -a'
alias renet='systemctl restart NetworkManager.service'

# Applications
alias -s pdf='xdg-open'

# Remove global because it breaks: pacman -D --asdeps grep
alias grep='grep --color=auto --exclude-dir={.git,.hg}'

# Pacman
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rs'
alias pacs='pacman -Ss'

# Systemctl
alias sysnet="systemctl restart NetworkManager.service"
alias sysvpn="systemctl restart openvpn-client@ic.service"
alias wacom="xsetwacom --set 'Wacom One by Wacom S Pen stylus' mode relative"

# Directories
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color=auto"
