#!/bin/bash
# Simple setup.sh for configuring new Linux system
# allows user to select git branch for the system type

# let's make the user set their git information so future
# commits will not bitch about it
echo -e "Please enter the email you want to tell git"
read email
echo -e ""
echo -e "Please enter the name you want to tell git"
read name
# set git config with read values
git config --global user.email "$email"
git config --global user.name "$name"

# ignore tags files globally (works with rsync due to .cvsignore)
# this tidbit came from the python-mode readme:
# https://github.com/tpope/vim-pathogen#faq
echo -e ""
echo -e "Creating '.cvsignore' and setting as global excludes file (tags etc)"
git config --global core.excludesfile '~/.cvsignore'
echo tags >> ~/.cvsignore

# use first argument as branch name (if present)
branch=$1
# no branch specified at command line
if [ "$branch" == "" ]; then
  # ask user for desired branch
  echo -e ""
  echo -e "Branch was not specified, please enter branch to use:"
  echo $(git branch -a | tail -n +4 | cut -d'/' -f3-) | tr ' ' '\n'
  echo -e ""
  echo -e "Entering nothing will default to master branch\n"
  read branch
fi
if [ "$branch" != "" ]; then
  git checkout $branch
  # re-run after checkout
  ./setup.sh
fi
