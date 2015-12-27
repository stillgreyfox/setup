#!/bin/bash
# Simple setup.sh for configuring Debian based server

# build utilities
sudo apt-get install -y build-essential autoconf automake cmake

# system utilities
sudo apt-get install -y screen
#sudo apt-get install -y sshfs autofs curl
#sudo apt-get install -y git subversion

# main apps
sudo apt-get install -y vim vim-nox ctags

# git clone and install dotfiles as well
./install_dotfiles.sh
