#!/bin/bash

#------------(-s) File Operator
filename=$1
if [ -s $filename ]
then
	echo "File size is more than zero. "
else
	echo "File size is zero."
fi
