#!/bin/bash


#-------(-h) Operator
name=$1
if [ -h $name ]
then
	echo "It is a symbolic link."
else
	echo "It is not a Symbolic link."
fi

#-------(-L) OPerator

name=$1
if [ -L $name ]
then
  echo "It is a symbolic link."
else
  echo "It is not a symbolic link."
fi
#Both operator used to know if a file
# is a SYmbolic Link 
#(In this case it will print "It is a symbolic link." Twise)
