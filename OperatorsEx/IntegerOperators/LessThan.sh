#!/bin/bash

#-------- (-lt) Operator ----------
n=50
if [ $n -lt 50 ]
then
  echo "The number is less than 50 "
else
  echo "THe number is equal or grater than 50"
fi


#------- (<) Operator --------
if [[ $n < 50 ]]
then
  echo "The number is less than 50 "
else
  echo "The number is greater than or equals to 50 "
fi
