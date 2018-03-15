# Prompt
if [[ -n $SSH_CLIENT  ]]; then
    PS1=$'\e[0;31m[\h]\e[0m \w $ '
else
    PS1='\w $ '
fi

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
