#!/bin/bash


#---------(-le) Less than or equal to Operator
n=50
if [ $n -gt 50 ]
then
  echo "The number is greater tan 50 "
else
  echo "The number is less or equal to 50 "
fi


j=55
if (( $j > 50 ))
then
  echo "The number is greater than 50 "
else
  echo "The number is less than or equal to 50 "
fi
#----- (>) OPerator -----------
