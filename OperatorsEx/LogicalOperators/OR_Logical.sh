#!/bin/bash

#------(-o) OPerator is used as logical Or -------
score1=55
score2=75
if [ $score1 -eq 55 -o $score2 -eq 80 ]
then
	echo "You have passed"
else
	echo "Yove failed"
fi
