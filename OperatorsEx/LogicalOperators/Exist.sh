#!/bin/bash

#-------(-f) file operator ---------
if [ -f "testFile.txt" ]
then
	echo "File exists. "
else
	echo "File does not exists. "
fi
#-(-f) File OPertor is used to know if a file exist
