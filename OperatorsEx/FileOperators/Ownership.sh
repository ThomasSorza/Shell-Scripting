#!/bin/bash

# (-O file Operator) used to check the ownership of the file

if [ -O $1 ]
then
  echo "Owner of the file."
else
  echo "Not the owner of the file."
fi
