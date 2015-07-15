home=/home/urbain
vimdir=$home/dotfiles

declare -A repodirs

# General purpose
repodirs[alols/xcape]=/home/urbain/xcape
repodirs[icholy/ttygif]=/home/urbain/github/ttygif

# Solarized
# repodirs[Anthony25/gnome-terminal-colors-solarized]=/home/urbain/github/gnome-terminal-colors-solarized
repodirs[altercation/mutt-colors-solarized]=/home/urbain/github/mutt-colors-solarized
repodirs[seebi/dircolors-solarized]=/home/urbain/github/dircolors-solarized

# Mp plugins
repodirs[uvaes/fzf-marks]=/home/urbain/github/fzf-marks
# repodirs[uvaes/grm]=/home/urbain/github/grm

# fzf-related
# repodirs[atweiden/fzf-extras]=/home/urbain/github/fzf-extras
repodirs[junegunn/fzf]=/home/urbain/.fzf

# Plugin managers
repodirs[tmux-plugins/tpm]=/home/urbain/.tmux/plugins/tpm
repodirs[junegunn/vim-plug]=/home/urbain/.vim/vim-plug
repodirs[tarjoilija/zgen]=/home/urbain/.zgen

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
actions[rupa/z]='make'
actions[junegunn/vim-plug]='after_vimplug'
