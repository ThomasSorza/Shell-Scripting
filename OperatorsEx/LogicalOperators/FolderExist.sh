#!/bin/bash

#----(-d) Used to know if a dir exist
name=$1
if [ -d $name ]
then
  echo "Folder exist."
else
  echo "Folder does not exist"
fi
