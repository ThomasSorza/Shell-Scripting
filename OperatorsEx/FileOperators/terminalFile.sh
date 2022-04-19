#!/bin//bash

#---(-t) Operator
if [ -t 1 ]
then
  echo "File is associated with terminal."
else
  echo "FIle is not associated with terminal."
fi
#Used to check if a file is associated with the terminal (Terminal special file)
