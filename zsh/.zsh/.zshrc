## zgen {{{

[ ! -d ~/.zsh/zgen ] && git clone https://github.com/tarjoilija/zgen.git ~/.zsh/zgen
source "$HOME/.zsh/zgen/zgen.zsh"

# Load plugins
if ! zgen saved; then

    echo "Creating a zgen save"

    # Load oh-my-zsh framework
    zgen oh-my-zsh

    # Oh-my-zsh plugins
    zgen oh-my-zsh plugins/git

    # Navigation plugins
    zgen load urbainvaes/fzf-marks
    # zgen load wfxr/fzf-marks

    # Other plugins
    zgen load rupa/z

    # zsh-users plugins
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions

    # Save all to init script
    zgen save
fi

# Autosuggestion
{
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
}

# }}}
## Overwrite default options {{{
PROMPT='%0~ $ '

# Options
unsetopt histverify
# }}}
## My bindings {{{
bindkey -v
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^?' backward-delete-char # backspace
bindkey '^N' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^a' beginning-of-line
bindkey '^b' backward-char
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^g' jump
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^v' visual-mode
bindkey '^w' backward-kill-word
bindkey '^y' autosuggest-accept
bindkey '^z' z
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

[[ -z ${ZSH_COLORS} ]] && ZSH_COLORS=${HOME}/.local/share/zsh/colors.zsh
[[ -f ${ZSH_COLORS} ]] && source ${ZSH_COLORS}

colorschemes=$(ls ${HOME}/.Xresources)

function colo {

    XRESOURCE=$1
    XRESOURCE_FILE=${HOME}/.Xresources/${XRESOURCE}

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
}

# Completion for colorschemes (-M -> Case insensitive)
compctl -k "(${colorschemes})" -M 'm:{a-z}={A-Z}' colo

# }}}
## Aliases {{{

# Commands
alias cdd='cd ~/dotfiles'

# Programs
alias a='vifm . .'
alias ff='FreeFem++'
alias m='cd ~/.mutt/attachments && mutt && cd -'
alias e='nvim'
alias mux='tmuxinator'
alias n='nvim'
alias ns='nvim -S Session.vim'
alias v='vim'
alias vs="vim -S Session.vim"
alias email="mbsync -a"

# Git
alias g='git'
alias rd='cd $(git rev-parse --show-toplevel)'

# GNU Make
alias mi='make install'
alias mc='make clean'
alias mca='make clean-all'

# Applications
alias -s pdf='xdg-open'

# Global
alias -g grep='grep --color=auto --exclude-dir={.git,.hg}'

# }}}
