#!/bin/bash

#---------(<) Operator .-----
str1="Mango"
str2="Orange"
if [[ $str1 < $str2 ]]
then
  echo "$str1 is lower than $str2"
else
  echo "$str2 is greater than $str1"
fi
