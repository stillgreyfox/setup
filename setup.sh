#!/bin/bash
# setup.sh for configuring Debian based server

# If we're not running as root enforce sudo membership requirement
if [[ $EUID -ne 0 ]]; then
    # Not root, only proceed if user is in the sudo group
    user=$(whoami)
    if groups $user | grep &>/dev/null '\bsudo\b'; then
        # Check for sudo availability
        which sudo
        if [[ $? -ne 0 ]]; then
            echo ""
            echo "sudo is not installed!"
            echo ""
            echo "Run this script as root to install sudo and /root/dotfiles"
            echo ""
            echo "OR"
            echo ""
            echo "Manually install sudo as root:"
            echo "    # su"
            echo "    $ apt-get install sudo"
            echo "    $ exit"

            exit 1
        else
            # build utilities
            sudo apt-get install -y build-essential autoconf automake cmake

            # system utilities
            sudo apt-get install -y screen
            #sudo apt-get install -y sshfs autofs curl
            #sudo apt-get install -y git subversion

            # main apps
            sudo apt-get install -y vim vim-nox ctags

            # git clone and install dotfiles into the user's home directory
            echo "Cloning and installing latest dotfiles to $HOME/dotfiles"
            ./install_dotfiles.sh d8s

            # prompt user to choose default editor (may be done done with ENV too)
            sudo update-alternatives --config editor
        fi
    else
        echo ""
        echo "User: $user is not a member of the sudo group!"
        echo ""
        echo "Please add yourself to the sudo group by running:"
        echo "    # su"
        echo "    $ adduser $user sudo"
        echo "    $ exit"
        echo "Logout and login as the $user to complete permissions update"

        exit 1
    fi
else
    # Check for sudo availability
    which sudo
    if [[ $? -ne 0 ]]; then
        echo ""
        echo "sudo was not detected, installing..."

        # install sudo utility (in case of bare system)
        apt-get install -y sudo
    fi

    # build utilities
    sudo apt-get install -y build-essential autoconf automake cmake

    # system utilities
    sudo apt-get install -y screen
    #sudo apt-get install -y sshfs autofs curl
    #sudo apt-get install -y git subversion

    # main apps
    sudo apt-get install -y vim vim-nox ctags

    # git clone and install dotfiles into the user's home directory
    echo "Cloning and installing latest dotfiles to $HOME/dotfiles"
    ./install_dotfiles.sh d8s

    # prompt user to choose default editor (may be done done with ENV too)
    sudo update-alternatives --config editor

    # enable bash-completion in global .bashrc
    printf "\n\
# enable bash completion in interactive shells \n\
# this copy added by setup.sh (lazier than trying to uncomment) \n\
if ! shopt -oq posix; then \n\
    if [ -f /usr/share/bash-completion/bash_completion ]; then \n\
        . /usr/share/bash-completion/bash_completion \n\
    elif [ -f /etc/bash_completion ]; then \n\
        . /etc/bash_completion \n\
    fi \n\
fi \n" >> /etc/bash.bashrc
    
    # replace /etc/motd with custom message of the day
    mv /etc/motd /etc/motd~
    printf "\n\
Welcome to the Debian 8 Master Development System \n" > /etc/motd

    # git clone and install dotfiles into the root's home directory
    echo "Cloning and installing latest dotfiles to $HOME/dotfiles"
    ./install_dotfiles.sh d8s
fi
