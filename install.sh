#!/usr/bin/env bash
# setup from sontek's great dotfiles

function backup_rename {

    if [ -e "$HOME/${1}" ];
    then
        backup_rename "$1.bak";
    else
        echo "Backing up ${target##*/} to ${1}"
        cp -P $target "$HOME/${1}"
        rm $target
    fi
}

echo "Installing symlinks"
function link_file {
    source="${PWD}/$1"
    base="${1##*/}"
    target="${HOME}/.${base/\.symlink/}"

    if [ -e "${target}" ]; then
        current_pointer="$(readlink -f ${target})"
        if [ ${current_pointer} = ${source} ]; then
            echo "Already symlinked: ${target}"
            return 0
        else
            backup_rename "${target##*/}.bak"
        fi

    fi
    ln -sf ${source} ${target}
}

function setup_vim_swaps {
    mkdir -p $HOME/.vim-cache/backups
    mkdir -p $HOME/.vim-cache/swaps
    mkdir -p $HOME/.vim-cache/undo
}

# find symlinks in subdirectories
for i in *
    do
        if [ -d "${PWD}/${i}" ]; then
            for j in $i/*.symlink
            do
                if [ -e "${PWD}/${j}" ]; then
                    link_file $j
                fi
            done
        fi
done

# find symlinks in current directory
for i in *.symlink
    do
    if [ -e "${PWD}/${i}" ]; then
        link_file $i
    fi
done

setup_vim_swaps

echo "Updating submodules"

git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update

