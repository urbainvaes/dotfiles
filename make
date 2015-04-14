#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old

# Files to sync
files="vim mutt vifm bashrc zshrc xmodmap mynotes tmux.conf zathurarc offlineimaprc inputrc latexmkrc crontab gitconfig"

rm -rf $olddir
mkdir -p $olddir

cd $dir
for file in $files; do
    echo $file
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

# SSMTP config
echo ssmtp.conf
sudo mv /etc/ssmtp/ssmtp.conf $olddir
sudo ln -s $dir/ssmtp.conf /etc/ssmtp/

# Solarized
cd
rm -rf .solarized
mkdir .solarized
cd .solarized
git clone https://github.com/altercation/mutt-colors-solarized
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized/
git clone https://github.com/seebi/dircolors-solarized

cd
rm -rf .vim/bundle
mkdir .vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

cd $dir
cd mutt
mkdir temp

# Tmux
cd 
rm -rf .tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf
