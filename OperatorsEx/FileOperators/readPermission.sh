#!/bin/bash

#(-r) Operator is used to check the read perission of a file
name=$1
if [ -r $name ]
then
	echo "File has a read permission."
else
	echo "File does not have read permission."
fi
