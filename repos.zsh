declare -A repodirs install

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
repodirs[tarjoilija/zgen]=/home/urbain/.zgen

# Experimental
repodirs[adbrebs/taxi]=/home/urbain/github/taxi

# Installation
function after_vimplug {
    cd ..
    rm -rf autoload
    mkdir -p autoload
    cd autoload
    ln -s ../vim-plug/plug.vim;
}

install[alols/xcape]='make'
install[icholy/ttygif]='make'
install[junegunn/fzf]='./install'
install[junegunn/vim-plug]='after_vimplug'

# Uninstallation
uninstall[junegunn/fzf]='./uninstall'
