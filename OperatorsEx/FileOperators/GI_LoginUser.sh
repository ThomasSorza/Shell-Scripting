#!/bin/bash

# (-G file Operator) use to check if both group id of the file and the login
# user is the same.

if [ -G $1 ]
then
  echo "Group Id are the same."
else
  echo "Group ID are not the same."
fi
