#!/bin/bash

#Reading data from user
read -p 'Enter a : ' a
read -p 'Enter a : ' b

leftshift=$(( a<<1 ))
echo Left Shift of a is $leftshift

rightshift=$(( b>>1 ))
echo Right Shift of b is $rightshift
