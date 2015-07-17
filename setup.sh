#!/bin/bash
# Simple setup.sh for configuring Ubuntu based workstation

# install some frequently used utlities
sudo apt-get install screen vim build-essential \
                     automake autoconf cmake \
                     libffi-dev libssl-dev\
                     sshfs autofs \
                     ipython ipython-doc ipython-notebook \
                     python-setuptools python-dev python-tk libblas-dev\
                     curl git subversion meld octave wxmaxima \
                     gimp inkscape blender xournal
# these are the packages for pip and virtual env, but may be old
#sudo apt-get install python-pip python-virtualenv

# for newer versions use python's internal setuptools to get pip,
# then use pip to get virtualenv
sudo easy_install pip
sudo -H pip install -U "requests[security]"
sudo -H pip install -U pip virtualenv

# git clone and install dotfiles as well
#./install_dotfiles.sh
