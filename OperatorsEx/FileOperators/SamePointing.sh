#!/bin/bash

# (-ef File Operator) used to check if 2 hard links are pointing the same file

if [ $1 -ef $2 ]
then
	echo "$1 and $2 are pointing to the same file"
else
	echo "$1 and $2 are not pinting to the same file"
fi
