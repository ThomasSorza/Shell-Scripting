#!/bin/bash


#(-ge) Evaluates if number is greater than another value
n=50
if [ $n -ge 50 ]
then
  echo "The number is greater than or equal to 50 "
else
  echo "The number is les tan 50 "
fi


#------(>=) Operator -------
j=55
if (( $j >= 55 ))
then
  echo "The number is greater than or equal to 55 "
else
  echo "The number is less than 55"
fi
