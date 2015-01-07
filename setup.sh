#!/bin/bash
# Simple setup.sh for configuring new Debian Linux system

# use first argument as branch name (if present)
branch=$1
# no branch specified at command line
if [ "$branch" == "" ]; then
  # ask user for desired branch
  echo "Branch was not specified, please enter branch to use:"
  echo "'workstation' - for new local system setup"
  echo "'ec2' - for new AWS EC2 vm instance setup"
  echo "'' - defaults to master branch, only does branch select"
  read branch
fi
if [ "$branch" != "" ]; then
  git checkout $branch
  # re-run after checkout
  ./setup.sh
fi
