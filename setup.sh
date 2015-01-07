#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# install some frequently used utlities
sudo apt-get install vim build-essential \
                     automake autoconf cmake \
                     ipython ipython-doc ipython-notebook \
                     curl git subversion meld octave \
                     gimp inkscape blender xournal

# Install emacs daily snapshot
# https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get -qq update
sudo apt-get install emacs-snapshot-nox \
                     emacs-snapshot-el \
                     emacs-snapshot-common

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
