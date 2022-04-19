#!/bin/bash

#(-ot file Oerator) is used to check if a file is older than other.

if [ $1 -ot $2 ]
then
	echo "$1 is older than $2"
else
	echo "$2 is older than $1"
fi
