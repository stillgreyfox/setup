#!/bin/bash
# setup script for configuring just dotfiles from setup.sh

SETUP_BRANCH=${1:d8s}

# backup any existing dotfiles
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv ./dotfiles ./dotfiles.old.$(date +%s)
fi

# clone latest dotfiles and pull latest submodules
git clone https://github.com/stillgreyfox/dotfiles.git
cd dotfiles
git checkout $SETUP_BRANCH
git submodule update --init
./setup.sh
