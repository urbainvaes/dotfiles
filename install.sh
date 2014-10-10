#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc xmodmap"    # list of files/folders to symlink in homedir

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

