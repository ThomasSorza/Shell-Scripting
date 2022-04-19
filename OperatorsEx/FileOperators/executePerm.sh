#!/bin/bash

#(-x) OPerator ued t check the execution permission of a file
name=$1
if [ -x $name ]
then
  echo "File count with execution permission."
else
  echo "File does not have execution permission"
fi

