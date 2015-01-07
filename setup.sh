#!/bin/bash
# Simple setup.sh for configuring new Debian Linux system

# use first argument as branch name (if present)
branch=$1
# no branch specified at command line
if [ "$branch" == "" ]
  # ask user for desired branch
  echo "Branch was not specified, please enter branch to use:"
  echo "'workstation' - for new local system setup"
  echo "'ec2' - for new AWS EC2 vm instance setup"
  echo "'' - defaults to master branch, current / minimal"
  read branch
fi
if [ "$branch" != "" ]
  git checkout $branch
fi

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs daily snapshot
# https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get -qq update
sudo apt-get install -y emacs-snapshot-nox emacs-snapshot-el emacs-snapshot-common

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

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

