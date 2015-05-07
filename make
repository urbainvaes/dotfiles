#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old

# Files to sync
files="vim vimrc mutt passwords vifm msmtprc bashrc zshrc xmodmap mynotes tmux.conf zathurarc offlineimaprc offlineimap.py inputrc latexmkrc crontab gitconfig git_template tmuxlinerc"

rm -rf $olddir
mkdir -p $olddir

cd $dir
chmod 600 msmtprc
for file in $files; do
    echo $file
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

# Symlink for neovim
rm ~/.nvim ~/.nvimrc
ln -s $dir/vim ~/.nvim
ln -s $dir/vimrc ~/.nvimrc

# Solarized
mkdir -p ~/.solarized
cd ~/.solarized

if [ ! -d ~/.solarized/mutt-colors-solarized ]; then
    git clone https://github.com/altercation/mutt-colors-solarized/
else
    cd mutt-colors-solarized
    git pull origin master
fi

if [ ! -d ~/.solarized/gnome-terminal-colors-solarized ]; then
    git clone https://github.com/Anthony25/gnome-terminal-colors-solarized/
else
    cd ~/.solarized/gnome-terminal-colors-solarized
    git pull origin master
fi

if [ ! -d ~/.solarized/dircolors-solarized ]; then
    git clone https://github.com/seebi/dircolors-solarized/
else
    cd ~/.solarized/dircolors-solarized
    git pull origin master
fi

if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
    cd ~/.vim/bundle/vundle
    git pull origin master
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm
    git pull origin master
fi

mkdir -p $dir/mutt/temp
