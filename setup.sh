#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# main apps
sudo apt-get install -y vim vim-nox ctags meld guake
# 2d graphics
sudo apt-get install -y gimp inkscape
# 3d graphics (commented due to big download)
#sudo apt-get install -y blender

# system utilities
sudo apt-get install -y screen sshfs autofs curl git subversion
# build utilities
sudo apt-get install -y build-essential autoconf automake cmake

# git clone and install dotfiles as well
./install_dotfiles.sh
