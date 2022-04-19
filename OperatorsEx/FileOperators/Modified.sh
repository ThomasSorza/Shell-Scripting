#!/bin/bash

# (-N file Operator) check if any file is modified or not.
if [ -N $1 ]
then
	echo  "File is modified."
else
	echo "File is not modified."
fi
