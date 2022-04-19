#!/bin/bah

n=20
v1=100
v2=200
echo $(( n>=20 ? v1 : v2 ))
# if the condition before '?' is true, Will execute the statement 
# defined before ':'. 
# if not, the statement after the ':' will be executed.
# (ALTERNATIVE of if statement).

#In this case will always be v1.
