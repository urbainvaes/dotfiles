# Prompt

if [[ -n $SSH_CLIENT  ]]; then
    PS1=$'\w\e[0;31m$ \e[0m'
else
    PS1='\w $ '
fi


# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
