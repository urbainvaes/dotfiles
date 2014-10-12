#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc zshrc muttrc vim xmodmap"

mkdir -p $olddir
cd $dir
for file in $files; do
    echo $file
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/.$file ~
done

rm -rf .vim/bundle
mkdir .vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

