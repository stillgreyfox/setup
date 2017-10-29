#!/bin/bash
# Simple setup.sh for configuring Windows-hosted mingw environment

# main apps
pacman -S --needed vim # ctags  # complains about max file size download...

# system utilities (optional)
#pacman -S --needed curl subversion sqlite3

# build utilities
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

# pull down dotfiles from github
./install_dotfiles.sh
