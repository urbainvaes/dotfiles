# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
if [[ -n $SSH_CLIENT  ]]; then
    PS1=$'\e[0;31m[\h]\e[0m \w $ '
else
    PS1='\w $ '
fi

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.zgen/urbainvaes/fzf-marks-master/fzf-marks.plugin.bash
