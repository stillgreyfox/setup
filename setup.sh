#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# main apps
sudo apt-get install -y vim vim-nox ctags xournal meld rdesktop
# math apps
sudo apt-get install -y octave wxmaxima maxima-share
# 2d graphics
sudo apt-get install -y gimp inkscape
# 3d graphics (commented due to big download)
#sudo apt-get install -y blender

# system utilities
sudo apt-get install -y screen sshfs autofs curl git subversion sqlite3
# build utilities
sudo apt-get install -y build-essential gfortran automake autoconf cmake
# libraries and utils for python pip, numpy / scipy
sudo apt-get install -y libffi-dev libssl-dev libblas-dev libatlas-base-dev
sudo apt-get install -y python-dev python-setuptools python-tk
sudo apt-get install -y python3-dev python3-setuptools python3-tk

# getting ipython stuff apt, for now, use pip+git for latest (see below)
# notebook changed names..
# (will figure out install later, for now package should exist)
sudo apt-get install -y ipython ipython-doc ipython-notebook
sudo apt-get install -y ipython3 ipython3-notebook
sudo apt-get install -y python3-venv
sudo apt-get install -y cookiecutter
# for newer versions, use python's internal setuptools to get pip,
# then use pip to get latest other stuff
sudo easy_install -U distribute
sudo easy_install pip
sudo -H pip install -U 'requests[security]'
sudo -H pip install -U pip virtualenv

# git clone and install dotfiles as well
./install_dotfiles.sh
