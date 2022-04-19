#!/bin/bash

#----- the (^) operator ----
echo $((3 ^ 6))
#bitwise XOR operation, result =  5


#----- the (^=) operator ----
var=5
((var⁼2))
echo $var
#result= var --> 7


#----- (~)Complement -----
echo $((~7))
#The complement of the value, result = -8


#----- (<<) left-shit ------
echo $(( 6<<1 ))
#left-shit a binary value, res ult = 12


#----- (<<=) -----
var1=5
((var <<= 1))
echo $var1
#result = 10

#----- (>>)  right-shift ----
echo $(( 8<<1 ))
#Right-shift a binary value, result = 4


#---- (>>=) -----
var2=7
((var >>= 1))
echo $var2
#result = 3
