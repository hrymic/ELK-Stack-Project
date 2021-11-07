#!/bin/bash

# need to run this script with sudo
# create user ($1) and add to group ($2)
# add user account
  echo "$1"
  adduser $1

# create group
  addgroup $2

# add user to group
  echo "Added $1 to $2 group"
  usermod -aG $2 $1

echo "End script"
