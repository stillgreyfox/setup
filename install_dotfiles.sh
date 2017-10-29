#!/bin/bash
# Simple setup.sh for configuring just dotfiles from setup

SETUP_BRANCH=$(cd $HOME/setup && git branch | grep '\*' | sed 's/\*\ //g')

# git clone and install dotfiles as well
# TODO: make this do .old.$(date...) to avoid nesting
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv ./dotfiles ./dotfiles.old
fi
# this one only works if your master has submodules, after a checkout
# we have to explicitly update that branch's submodules
#git clone --recursive https://github.com/stillgreyfox/dotfiles.git
git clone https://github.com/stillgreyfox/dotfiles.git
cd dotfiles
git checkout $SETUP_BRANCH
git submodule update --init
./setup.sh
cd ../setup
