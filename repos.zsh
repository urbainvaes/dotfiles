declare -A repodirs
declare -A actions

# General purpose
repodirs[icholy/ttygif]=/home/urbain/github/ttygif
repodirs[alols/xcape]=/home/urbain/xcape

# Solarized
repodirs[altercation/mutt-colors-solarized]=/home/urbain/github/mutt-colors-solarized

# My plugins
repodirs[uvaes/fzf-marks]=/home/urbain/github/fzf-marks
repodirs[uvaes/grm]=/home/urbain/.grm

# fzf-related
repodirs[junegunn/fzf]=/home/urbain/.fzf
repodirs[atweiden/fzf-extras]=/home/urbain/github/fzf-extras

# Plugin managers
repodirs[junegunn/vim-plug]=/home/urbain/.vim/vim-plug
repodirs[tmux-plugins/tpm]=/home/urbain/.tmux/plugins/tpm
# repodirs[tarjoilija/zgen]=/home/urbain/.zgen

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
