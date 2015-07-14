#!/bin/bash

home=/home/urbain
dir=$home/dotfiles
olddir=$home/dotfiles_old

function install_dotfiles {
    echo -e "\n*** \e[1mInstalling dotfiles\e[0m ***"

    rm -rf $olddir
    mkdir -p $olddir

    listFiles=`ls --ignore="make" --ignore="README.md"`

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

    cd $dir
    mkdir -p vim/vimundo
    mkdir -p mutt/temp
    mkdir -p mutt/cache
    mkdir -p mutt/cache/bodies
}

function clean {
    echo -e "\n*** \e[1mCleaning dotfiles\e[0m ***"
    for file in `ls`; do
        rm -rfv  ~/.$file
    done
}

function install_packages {

    # General
    sudo apt-get install ttyrec mutt msmtp offlineimap wmctrl rxvt-unicode-256color \
        tmux git gcc clang cmake make zathura feh chromium-browser zsh

    # For xcape
    sudo apt-get install pkg-config libx11-dev libxtst-dev libxi-dev clang
}

function update_dotfiles {
    cd $dir
    echo -e "\n*** \e[1m Updating dotfiles repository\e[0m ***"
    git fetch -q origin master
    cat <(git log --reverse --pretty=format:"-- %h %s (%cr)" -4); echo -e "\e[36m"
    output=$(git log HEAD..origin)
    if [[ ! -z $output ]]; then
        cat <(git log --reverse --pretty=format:"-- %h %s (%cr)" HEAD..origin); echo -e "\e[0m"
    else
        echo -e "-- No updates since last pull\e[0m"
    fi
}

update_dotfiles
install_dotfiles
