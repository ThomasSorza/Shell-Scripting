#!/bin/bash


# (-u) Oerator i used to check if the user id (SUID) is set or not for a file.
if [ -u $1 ]
then
  echo "User id (SUID) is set."
else
  echo "User id (SUID) is not set."
fi
