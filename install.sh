#!/bin/bash

home=/home/urbain
dir=~/dotfiles
olddir=~/dotfiles_old

install_dotfiles=0
install_repos=0
install_aux=0

while [[ $# > 0 ]]
do
    key="$1"
    echo $key
    case $key in
        -d|--dotfiles)
            install_dotfiles=1
            ;;
        -r|--repositories)
            install_repos=1
            ;;
        -l|--lib)
            install_aux=1
            ;;
        *)
            ;;
    esac
    shift
done

if [[ "$install_dotfiles" -eq "1"  ]]; then

    echo -e "\n*** Installing dotfiles ***"


    rm -rf $olddir
    mkdir -p $olddir

    listFiles=`ls --ignore="make" --ignore="tex" --ignore="README.md"`

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
    mkdir -p nvim/vimundo
    mkdir -p mutt/temp
    mkdir -p mutt/cache
    mkdir -p mutt/cache/bodies
fi

if [[ "$install_repos" -eq "1" ]]; then
    echo -e "\n *** Updating/Creating git repositories ***"

    declare -A repos
    repos[altercation]=$home/.solarized/mutt-colors-solarized
    repos[Anthony25]=$home/.solarized/gnome-terminal-colors-solarized
    repos[seebi]=$home/.solarized/dircolors-solarized
    repos[gmarik]=$home/.vim/bundle/vundle
    repos[junegunn]=$home/.nvim/vim-plug
    repos[tmux-plugins]=$home/.tmux/plugins/tpm
    repos[uvaes]=$home/git/fuzzy-zsh-marks
    repos[alols]=$home/xcape

    for author in "${!repos[@]}"; do
        thisDir=${repos[$author]}
        if [ ! -d $thisDir ]; then
            parentDir=`echo $thisDir | sed 's/\/[^\/]\+$//g'`
            githubDir=https://github.com/$author`echo $thisDir | sed 's/.*\(\/[^\/]\+\)$/\1/g'`
            mkdir -p $parentDir; cd $parentDir
            echo "Cloning $githubDir in $parentDir..."
            git clone -q $githubDir >> /dev/null
        else
            cd $thisDir
            echo "Updating git repository stored in $thisDir"
            git pull -q origin master >> /dev/null
            cat <(git log --pretty=format:"-- %h %s (%cr)" "ORIG_HEAD...HEAD")
        fi
    done

    # Installing vim-plug vim package manager
    cd $dir/nvim
    if [ -e autoload ]; then
        rm -rf autoload
    fi
    mkdir -p autoload
    ln -s $dir/nvim/vim-plug/plug.vim $dir/nvim/autoload/plug.vim
fi

# Creating auxiliary files
if [[ "$install_aux" -eq "1" ]]; then
    echo "Nothing to do for -a"
fi

echo -e "\n*** Installation successful *** \n"
