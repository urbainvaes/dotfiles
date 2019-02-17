## startx automatically {{{
[[ -z $DISPLAY && -z $SSH_CONNECTION && $XDG_VTNR -eq 1 ]] && exec startx
# }}}
## Bindings {{{
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

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^W' edit-command-line
# }}}
## Options and modules {{{

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

# Completion
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

FZF_MARKS_PLUGIN_ZSH=$HOME/Dropbox/projects/fzf-marks/fzf-marks.plugin.zsh
[ -f "$FZF_MARKS_PLUGIN_ZSH" ] && source "$FZF_MARKS_PLUGIN_ZSH"

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

# }}}
## fzf {{{

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fzf with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
  zle && zle reset-prompt
}
zle     -N   z

# }}}
## Colors {{{

[[ -f $HOME/.local/colors.zsh ]] && source $HOME/.local/colors.zsh

colorschemes=$(ls ${HOME}/.Xresources)

function colo {

    COLORSCHEME=$1
    XRESOURCE_FILE=${HOME}/.Xresources/$COLORSCHEME

    # Change colors for current session
    if [[ ! -z "$TMUX" ]]; then
        printf '\x1bPtmux;'
        esc='\x1b\x1b'
    else
        esc='\x1b'
    fi

    /usr/bin/cpp ${XRESOURCE_FILE} | tr -d ' \t' | sed -n \
        -e "s/.*background:/${esc}]11;/p" \
        -e "s/.*foreground:/${esc}]10;/p" \
        -e "s/.*cursorColor:/${esc}]12;/p" \
        -e "s/.*borderColor:/${esc}]708;/p" \
        -e "s/.*color\\([0-9][^:]*\\):/${esc}]4;\\1;/p" | tr \\n \\a

    # Change color for future sessions
    xrdb ${XRESOURCE_FILE}

    echo "export COLORSCHEME=$1" > $HOME/.local/colors.zsh
    source $HOME/.local/colors.zsh
}

# Completion for colorschemes (-M -> Case insensitive)
compctl -k "(${colorschemes})" -M 'm:{a-z}={A-Z}' colo

function show256 {
    for i in {0..255} ; do
        printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
        if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
            printf "\n";
        fi
    done
}

# }}}
## Aliases {{{

# Directories
alias cdd='cd ~/dotfiles'

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
alias ff='FreeFem++'
alias m='cd ~/.mutt/attachments && mutt && cd -'
alias e='nvim'
alias mux='tmuxinator'
alias email='mbsync -a'
alias renet='systemctl restart NetworkManager.service'

# Applications
alias -s pdf='xdg-open'

# Global
alias -g grep='grep --color=auto --exclude-dir={.git,.hg}'

# Pacman
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rs'
alias pacs='pacman -Ss'

# Systemctl
alias sysnet="systemctl restart NetworkManager.service"
alias sysvpn="systemctl restart openvpn-client@ic.service"

# Directories
alias ..="cd .."
alias ...="cd ../.."
# }}}
