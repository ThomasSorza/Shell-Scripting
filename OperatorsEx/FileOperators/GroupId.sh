#!/bin/bash


#--(-g) Operator is used to check the group id (SGID) is set or not for a file.

name=$1
if [ -g $name ]
then
  echo "Group id (SGID) is set."
else
  echo "Group id (SGID) is not set."
fi
