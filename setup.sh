#!/bin/bash
# Simple setup.sh for configuring new Linux system
# allows user to select git branch for the system type

# let's make the user set their git information so future
# commits will not bitch about it
echo -e "Please enter the email you want to tell git\n"
read email
echo -e "Please enter the name you want to tell git\n"
read name
# set git config with read values
git config --global user.email "$email"
git config --global user.name "$name"

# ignore tags files globally (works with rsync due to .cvsignore)
# this tidbit came from the python-mode readme:
# https://github.com/tpope/vim-pathogen#faq
git config --global core.excludesfile '~/.cvsignore'
echo tags >> ~/.cvsignore

# use first argument as branch name (if present)
branch=$1
# no branch specified at command line
if [ "$branch" == "" ]; then
  # ask user for desired branch
  echo -e "Branch was not specified, please enter branch to use:\n"

  echo -e "  'workstation' - for new local system setup for development"
  echo -e "  'ec2'         - for new AWS EC2 vm instance setup"
  echo -e "  'cnc'         - for new local system setup for CNC machines"
  echo -e "  ''            - defaults to master branch, only does branch select\n"
  read branch
fi
if [ "$branch" != "" ]; then
  git checkout $branch
  # re-run after checkout
  ./setup.sh
fi
