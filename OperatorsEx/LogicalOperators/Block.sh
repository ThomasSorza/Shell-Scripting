#!/bin/bash

#(-b) Operator is used to check if is a
# block special file

name=$1
if [ -b $name ]
then
  echo "This is a block special file"
else
  echo "This is not a block special file"
fi 
