#!/bin/bash


# ------ (-le) Less than or equal to Operator
n=50
if [ $n -le 50 ]
then
  echo "The number is less than or equal to 50 "
else
  echo "THe number is greater than 50 "
fi


#-------(<=) Operator --------
j=55
if (( $j <= 50 ))
then
  echo "The number is less than or equal to 50 "
else
  echo "The number is greater than 50 "
fi
