#!/bin/bash

#-------(-e) file operator ---------
filename=$1
if [ -e $filename ]
then
	echo "File or Folder exists. "
else
	echo "File or Folder does not exists. "
fi
#-----(-e) Operator check if the file exist
