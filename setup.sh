#!/bin/bash
# Simple setup.sh for configuring Windows-hosted mingw environment

# main apps
pacman -S --needed vim # ctags  # complains about max file size download...

# system utilities (optional)
#pacman -S --needed curl subversion sqlite3

# build utilities
#   adapted from help here:
#     https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2
pacman -S --needed \
	base-devel \
	mingw-w64-i686-toolchain \
	mingw-w64-x86_64-toolchain \
	mingw-w64-i686-cmake \
	mingw-w64-x86_64-cmake \
	python3 \
	python3-pip

# python stuff
# INSTALL Miniconda separately on Windows host

# fix vim / vi annoyance
cp -a /usr/bin/vim.exe /usr/bin/vi.exe

# create dr dirs
mkdir -p $HOME/dr/local
mkdir -p $HOME/dr/github
mkdir -p $HOME/dr/bitbucket

# pull down dotfiles from github
./install_dotfiles.sh
