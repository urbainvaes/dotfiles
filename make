#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old

# Files to sync
files="vim mutt vifm bashrc zshrc xmodmap mynotes tmux.conf zathurarc offlineimaprc inputrc crontab"

rm -rf $olddir
mkdir -p $olddir

cd $dir
for file in $files; do
    echo $file
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

# Fetchmailrc (protect sensitive information)
# mv ~/.fetchmailrc $olddir
# cp $dir/.fetchmailrc ~
# vim ~/.fetchmailrc
# read password
# sed -i 's/xx_change_me_xx/'$password'/g' ~/.fetchmailrc

# SSMTP config
echo ssmtp.conf
sudo mv /etc/ssmtp/ssmtp.conf $olddir
sudo ln -s $dir/ssmtp.conf /etc/ssmtp/

# Permissions
cd
sudo chmod 600 ~/.fetchmailrc
sudo chmod 600 $dir/.mailfilter

sudo rm -rf .vim/bundle
mkdir .vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
