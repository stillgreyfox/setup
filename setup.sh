#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# main apps
sudo apt-get install -y vim vim-nox xournal meld
# math apps
sudo apt-get install -y octave wxmaxima maxima-share
# 2d graphics
sudo apt-get install -y gimp inkscape
# 3d graphics (commented due to big download)
#sudo apt-get install -y blender

# system utilities
sudo apt-get install -y screen sshfs autofs curl git subversion
# build utilities
sudo apt-get install -y build-essential gfortran automake autoconf cmake
# libraries and utils for python pip, numpy / scipy
sudo apt-get install -y libffi-dev libssl-dev libblas-dev libatlas-base-dev
sudo apt-get install -y python-dev python-setuptools python-tk

# getting ipython stuff apt, for now, use pip+git for latest (see below)
# notebook changed names..
# (will figure out install later, for now package should exist)
sudo apt-get install ipython ipython-doc ipython-notebook

# for newer versions, use python's internal setuptools to get pip,
# then use pip to get latest other stuff
# UPDATE: modified this to also install IPython 2.0
# using steps from https://theoryl1.wordpress.com/2014/03/16/
#                  install-ipython-2-0-on-linux-mint-maya/
sudo easy_install -U distribute
sudo easy_install pip
sudo -H pip install -U "requests[security]"
sudo -H pip install -U pip virtualenv
#sudo apt-get install pandoc python-pygame
#sudo -H pip install jinja2 sphinx pyzmq pygments tornado \
#                    nose pexpect matplotlib jsonschema
## had to explicitly update tornado (default was v3.x, ipython nb wants 4.x)
#sudo -H pip install -U tornado
sudo -H pip install ipython

# git clone and install dotfiles as well
./install_dotfiles.sh

## these were for a python web / db app tutorial on youtube.
## commenting for now, to be moved to a dr dir with custom scripts...
#sudo apt-get install pandoc python-pygame
#sudo -H pip install jinja2 sphinx pyzmq pygments tornado \
#                 nose pexpect matplotlib jsonschema
## had to explicitly update tornado (default was v3.x, ipython nb wants 4.x)
#sudo -H pip install -U tornado
## NOTE: building scipy and the kits takes 30 ish mins!
#sudo -H pip install scipy scikit-image scikit-learn
## tried to get the master branch of ipython, but didn't run, used pip instead
##cd $HOME
##git clone --recursive https://github.com/ipython/ipython.git
##cd ipython
##sudo python setup.py install
#sudo -H pip install ipython
