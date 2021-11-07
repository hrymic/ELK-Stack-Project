#!/bin/bash

# must be run with sudo

# lockout user
  echo "User account locked"
  usermod -L $1

# check groups
  echo "Current groups for user"
  groups $1 

# remove user out of all groups
  echo "Removing $1 from all groups"
  usermod -G $1 $1

# confirm groups
  echo "Check groups"
  groups $1

# delete user and their home directory containing all their files
  echo "Delete user and user home directory"
  deluser --remove-home $1

# check for user
  cat /etc/passwd | grep $1

# check user for other groups
  cat /etc/group | grep $1

echo "End script"
