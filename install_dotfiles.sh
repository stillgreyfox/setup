#!/bin/bash
# Simple setup.sh for configuring just dotfiles from setup

SETUP_BRANCH=$(cd $HOME/setup && git branch | grep '\*' | sed 's/\*\ //g')

# git clone and install dotfiles as well
# TODO: make this do .old.$(date...) to avoid nesting
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv ./dotfiles ./dotfiles.old
fi
git clone https://github.com/stillgreyfox/dotfiles.git
cd dotfiles
get checkout $SETUP_BRANCH 
./setup.sh
cd ../setup
