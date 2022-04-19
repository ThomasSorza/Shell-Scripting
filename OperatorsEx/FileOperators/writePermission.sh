#!/bin/bash


#(-w) OPerator used to know if a fle has write permssion
name=$1
if [ -w $name ]
then
  echo "File has a write permission."
else
  echo "FIle doesn´t have a write permission."
fi
