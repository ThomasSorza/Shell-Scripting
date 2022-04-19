#!/bin/bash

#--------(-S) Operator
name=$1
if [ -S $name ]
then
  echo "It is a Socket."
else
  echo "It is not a Socket."
fi
#Used to check if a file is a socket or not
