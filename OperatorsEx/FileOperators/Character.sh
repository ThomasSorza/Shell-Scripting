#!/bin/bash

name=$1
if [ -c $name ]
then
  echo "This is a character special file."
else
  echo "This is not character special file."
fi
#(-c) USe to check if a file is a special character file
