#! /bin/bash

dotdir=/home/urbain/dotfiles


install_dotfiles() {
    for file in `ls -A --ignore="install.sh" --ignore="README.md" --ignore=".git*"`; do
        if [[ -f $file/Makefile ]]; then
            cd $file && make && cd $dotdir
        else
            rm -f $HOME/$file && ln -s $dotdir/$file $HOME/$file
        fi
    done
}


clean_dotfiles() {
    for file in `ls -A --ignore="install.sh" --ignore="README.md" --ignore=".git*"`; do
        if [[ -f $file/Makefile ]]; then
            cd $file && make clean && cd $dotdir
        else
            rm -f $HOME/$file
        fi
    done
}

clean_dotfiles
install_dotfiles
