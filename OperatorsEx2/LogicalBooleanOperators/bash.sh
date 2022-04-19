#!/bin/bash

#Reading Data from the user
read -p 'Enter a : ' a
read -p 'Enter b : ' b

if (( $a == "true" & $b == "true" ))
then
	echo Both are true.
else
	echo Both are not true.
fi

if (( $a == "true" || $b == "true"))
then
	echo Atleast one of them is true.
else
	echo NOne of them is true.
fi

if (( ! $a == "true" ))
then
	echo "a" was inicially false.
else
	echo "a" was inicially true.
fi
