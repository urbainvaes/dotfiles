#!/bin/bash

home=/home/urbain
dir=$home/dotfiles
olddir=$home/dotfiles_old

declare -A repodirs
repodirs[Anthony25/gnome-terminal-colors-solarized]=$home/.solarized/gnome-terminal-colors-solarized
repodirs[alols/xcape]=$home/xcape
repodirs[altercation/mutt-colors-solarized]=$home/.solarized/mutt-colors-solarized
repodirs[gmarik/vundle]=$dir/vim/bundle/vundle
repodirs[icholy/ttygif]=$home/ttygif
repodirs[junegunn/fzf]=$home/.fzf
repodirs[rupa/z]=$home/github/z
repodirs[atweiden/fzf-extras]=$home/github/fzf-extras
repodirs[junegunn/vim-plug]=$dir/nvim/vim-plug
repodirs[seebi/dircolors-solarized]=$home/.solarized/dircolors-solarized
repodirs[tmux-plugins/tpm]=$home/.tmux/plugins/tpm
repodirs[uvaes/fzf-marks]=$home/github/fzf-marks
repodirs[muennich/urxvt-perls]=$home/.urxvt/ext

function after_vimplug {
    cd ..
    rm -rf autoload
    mkdir -p autoload
    cd autoload
    ln -s ../vim-plug/plug.vim;
}

declare -A actions
actions[Anthony25/gnome-terminal-colors-solarized]=''
actions[alols/xcape]='make'
actions[altercation/mutt-colors-solarized]=''
actions[gmarik/vundle]=''
actions[icholy/ttygif]='make'
actions[junegunn/fzf]='./install'
actions[rupa/z]='make'
actions[atweiden/fzf-extras]=''
actions[junegunn/vim-plug]='after_vimplug'
actions[seebi/dircolors-solarized]=''
actions[tmux-plugins/tpm]=''
actions[uvaes/fzf-marks]=''
actions[muennich/urxvt-perls]=''

function fetch_repo {
    cd $1
    echo "Fetching origin of git repository stored in $1 ..."
    git fetch -q origin master
}

function clone_repo {
    githubDir=https://github.com/$1
    echo "Cloning $repo in $2"
    git clone -q $githubDir $2
    cd $2
}

function waitjobs {
    for job in `jobs -p`
    do
        wait $job
    done
}

function install_repos {
    echo -e "\n*** \e[1mInstalling git repositories\e[0m ***"

    for repo in "${!repodirs[@]}"; do

        repodir=${repodirs[$repo]}
        action=${actions[$repo]}

        if [ ! -d $repodir ]; then
            clone_repo $repo $repodir $action &
        else
            echo -e "\e[0mRepository $repo already installed in ${repodir}.\e[0m"
        fi
    done
    waitjobs
    echo "--> Done!"; echo

    echo -e "*** \e[1mExectutiong actions after installation\e[0m ***"
    for repo in "${!repodirs[@]}"; do
        cd ${repodirs[$repo]}
        eval ${actions[$repo]}
    done
}

function update_repos {
    echo -e "\n*** \e[1mUpdating git repositories\e[0m ***"

    for repo in "${!repodirs[@]}"; do

        repodir=${repodirs[$repo]}

        if [ -d $repodir ]; then
            fetch_repo $repodir &
        fi
    done

    waitjobs
    echo "--> Done!"; echo

    for repo in "${!repodirs[@]}"; do

        repodir=${repodirs[$repo]}

        if [ -d $repodir ]; then
            cd $repodir
            echo "Merging upstream updates of git repository stored in ${repo}..."
            cat <(git log --reverse --pretty=format:"-- %h %s (%cr)" -4); echo -e "\e[36m"
            output=$(git log HEAD..origin)
            if [[ ! -z $output ]]; then
                cat <(git log --reverse --pretty=format:"-- %h %s (%cr)" HEAD..origin); echo -e "\e[0m"
            else
                echo -e "-- No updates since last pull\e[0m"
            fi
            git merge -q origin/master
            echo
        fi
    done
}

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
    mkdir -p nvim/vimundo
    mkdir -p mutt/temp
    mkdir -p mutt/cache
    mkdir -p mutt/cache/bodies
}

function clean {
    echo -e "\n*** \e[1mCleaning repositories\e[0m ***"
    for repo in "${!repodirs[@]}"; do
        echo "Cleaning $repo in ${repodirs[$repo]}"
        rm -rf ${repodirs[$repo]}
    done

    echo -e "\n*** \e[1mCleaning dotfiles\e[0m ***"
    for file in `ls`; do
        rm -rfv  ~/.$file
    done
}

function install_packages {
    apt-get install ttyrec mutt msmtp
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

if [[ $# = 0 ]]; then
    update_dotfiles
    install_dotfiles
    update_repos
fi

while [[ $# > 0 ]]
do
    key="$1"
    case $key in
        -d|--dotfiles)
            install_dotfiles
            ;;
        -i|--repositories)
            install_repos
            ;;
        -u|--repositories)
            update_repos
            ;;
        -p|--packages)
            install_packages
            ;;
        -c|--clean)
            clean
            ;;
        -a|--all)
            clean
            install_dotfiles
            install_repos
            update_repos
            ;;
        *)
            ;;
    esac
    shift
done
