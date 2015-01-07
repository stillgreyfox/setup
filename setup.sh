#!/bin/bash
# Simple setup.sh for configuring new Debian Linux system

# use first argument as branch name (if present)
branch=$1
# no branch specified at command line
if [ "$branch" == "" ]; then
  # ask user for desired branch
  echo "Branch was not specified, please enter branch to use:"
  echo "'workstation' - for new local system setup"
  echo "'ec2' - for new AWS EC2 vm instance setup"
  echo "'' - defaults to master branch, current / minimal"
  read branch
fi
if [ "$branch" != "" ]; then
  git checkout $branch
  # re-run after checkout
  ./setup.sh
fi

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d.old
fi
if [ -d .vim/ ]; then
    mv .vim .vim.old
fi
git clone https://github.com/stillgreyfox/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.vim .

