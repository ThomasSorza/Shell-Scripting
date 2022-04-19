#!/bin/bash

#(-k File Operator) used to check if the sticky bit is set or not for a file.
if [ -k $1 ]
then
  echo "Sticky bit is set."
else
  echo "Sticky bit is not set."
fi
