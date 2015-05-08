#!/bin/bash


dir=~/dotfiles
olddir=~/dotfiles_old

rm -rf $olddir
mkdir -p $olddir

echo -e "\n*** Symlinking files *** \n"

if [ $# -eq 0 ]; then
    listFiles=`ls --ignore="make" --ignore="tex"`
else
    listFiles=$@
fi

cd $dir
for file in $listFiles; do
    if [ -e ~/.$file ]; then
        mv ~/.$file $olddir
        printf '~/.%-15s exists. ' $file
        echo -n "Moving it to $olddir. "
    fi
    ln -s $dir/$file ~/.$file
    echo "(Re)-creating symbolic link of $file."
done

if [ $# -ne 0 ]; then
    exit
fi

# Symlink for neovim
rm ~/.nvim ~/.nvimrc
ln -s $dir/vim ~/.nvim
ln -s $dir/vimrc ~/.nvimrc

echo -e "\n*** Updating/Creating git repositories *** \n"

declare -A repos
repos[altercation]=/home/urbain/.solarized/mutt-colors-solarized
repos[Anthony25]=/home/urbain/.solarized/gnome-terminal-colors-solarized
repos[seebi]=/home/urbain/.solarized/dircolors-solarized
repos[gmarik]=/home/urbain/.vim/bundle/vundle
repos[tmux-plugins]=/home/urbain/.tmux/plugins/tpm

for author in "${!repos[@]}"; do
    thisDir=${repos[$author]}
    if [ ! -d $thisDir ]; then
        parentDir=`echo $thisDir | sed 's/\/[^\/]\+$//g'`
        githubDir=https://github.com/$author`echo $thisDir | sed 's/.*\(\/[^\/]\+\)$/\1/g'`
        echo $githubDir
        mkdir -p $parentDir; cd $parentDir
        git clone $githubDir
    else
        cd $thisDir
        git pull origin master
    fi
done

echo -e "\n*** Installation successful *** \n"
