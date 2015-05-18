#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# install some frequently used utlities
sudo apt-get install screen vim build-essential \
                     automake autoconf cmake \
                     sshfs autofs \
                     ipython ipython-doc ipython-notebook \
                     python-dev python-tk libblas-dev\
                     curl git subversion meld octave wxmaxima \
                     gimp inkscape blender xournal
# these are the packages for pip and virtual env, but may be old
#sudo apt-get install python-pip python-virtualenv

# for newer versions use python's internal setuptools to get pip,
# then use pip to get virtualenv
sudo easy_install pip
sudo pip install virtualenv

# Install emacs daily snapshot
# https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get -qq update
sudo apt-get install emacs-snapshot-nox \
                     emacs-snapshot-el \
                     emacs-snapshot-common

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap


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
ln -sb dotfiles/.bash_logout .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.vim .
