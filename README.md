# dotfiles
This repository contains my configuration files.
Whenever possible, I use tools that follow the Unix philosophy.
I like *vim* for text editing, 
and I find it very convenient to use tools with *vi* keybindings:

+ Window manager: **i3**
+ File manager: **vifm**
+ Browser: **qutebrowser**
+ PDF viewer: **zathura**
+ Email client: **mutt**

# Management
Deploy with stow:

```bash
find . -mindepth 1 -maxdepth 1 -printf "%P\\0" | grep -zvFf .stowignore | \
    xargs -0 stow -t $HOME --no-folding
```

Personal files (`mutt` aliases, `vim` snippets, `tmuxinator` sessions, etc.) are located in a different git repository and stowed normally, with folding.
