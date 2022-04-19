#!/bin/bash

# (-nt) operator is used  to check if a file is newer than other file.

if [ $1 -nt $2 ]
then
	echo "$1 is newer tan $2"
else
	echo "$2 is newer than $1"
fi
