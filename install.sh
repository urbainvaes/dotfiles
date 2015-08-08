#!/bin/zsh

HOME=/home/urbain
dotdir=$HOME/dotfiles

unset dotdirs install uninstall
declare -A dotdirs install uninstall

for file in `ls -A --ignore="install.sh" --ignore="README.md" --ignore=".git"`; do
    dotdirs[$file]="$HOME/$file"
    install[$file]='ln -s $dotdir/$file $(basename $dotdirs[$file])'
    uninstall[$file]='rm -rf $dotdirs[$file]'
done

install_offlineimap() {
    ln -s $dotdir/.offlineimap/offlineimaprc .offlineimaprc
    ln -s $dotdir/.offlineimap/offlineimap.py .offlineimap.py
}

install_vim() {
    ln -s $dotdir/.vim/vimrc .vimrc
    ln -s $dotdir/.vim .vim
    ln -s $dotdir/.vim/vimrc .nvimrc
    ln -s $dotdir/.vim .nvim

    mkdir -p .vim/vimundo
}

install_mutt() {
    ln -s $dotdir/.mutt .mutt
    mkdir -p .mutt/temp
    mkdir -p .mutt/cache
    mkdir -p .mutt/cache/bodies
}

install_zsh() {
    ln -s $dotdir/.zsh/zshrc .zshrc
    ln -s $dotdir/.zsh .zsh
}

uninstall_offlineimap() {
    rm -f .offlineimaprc
    rm -f .offlineimap.py
}

uninstall_vim() {
    rm -rf .vim .vimrc .nvim .nvimrc
}

uninstall_zsh() {
    rm -rf .zsh .zshrc
}

dotdirs[.uzbl]="$HOME/.config/uzbl"
dotdirs[.zathurarc]="$HOME/.config/zathura/zathurarc"

install[.offlineimap]='install_offlineimap'
install[.vim]='install_vim'
install[.mutt]='install_mutt'
install[.zsh]='install_zsh'

uninstall[.offlineimap]='uninstall_offlineimap'
uninstall[.vim]='uninstall_vim'
uninstall[.zsh]='uninstall_zsh'

clean_dotfiles() {
    for file in ${(@k)dotdirs}; do
	echo "Cleaning $file"
        cd $(dirname $dotdirs[$file])
        eval ${uninstall[$file]}
    done
}

install_dotfiles() {
    for file in ${(@k)dotdirs}; do
	echo "Installing $file"
        cd $(dirname $dotdirs[$file])
        eval ${install[$file]}
    done
}

function install_packages {
    sudo apt-get install ttyrec mutt msmtp offlineimap wmctrl rxvt-unicode-256color \
        tmux git gcc clang cmake make zathura feh chromium-browser zsh clang xcape
}

clean_dotfiles
install_dotfiles
