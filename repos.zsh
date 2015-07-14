home=/home/urbain
dir=$home/dotfiles
olddir=$home/dotfiles_old

declare -A repodirs

# General purpose programs
repodirs[alols/xcape]=$home/xcape
repodirs[icholy/ttygif]=$home/github/ttygif

# Solarized for mutt
repodirs[altercation/mutt-colors-solarized]=$home/github/mutt-colors-solarized

# My repositories

# fzf-related
repodirs[uvaes/fzf-marks]=$home/github/fzf-marks
repodirs[atweiden/fzf-extras]=$home/github/fzf-extras
repodirs[junegunn/fzf]=$home/.fzf

# Plugin managers for tmux/vim/zsh
repodirs[tmux-plugins/tpm]=$home/.tmux/plugins/tpm
repodirs[junegunn/vim-plug]=$dir/vim/vim-plug
repodirs[tarjoilija/zgen]=$home/.zgen

function after_vimplug {
    cd ..
    rm -rf autoload
    mkdir -p autoload
    cd autoload
    ln -s ../vim-plug/plug.vim;
}

declare -A actions
actions[alols/xcape]='make'
actions[icholy/ttygif]='make'
actions[junegunn/fzf]='./install'
actions[junegunn/vim-plug]='after_vimplug'
