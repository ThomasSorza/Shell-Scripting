#!/bin/bash (Every single operator is aplied for binary data)


#------ & operator -------
echo $((3 & 6))
# 3 --> 0011 (aplied & operation)
# 6 --> 0110
#result=0010 == 2 (output)


#------ &= operator --------
var=3
echo $((var&=7))
# 3 --> 0011 (aplied & operation)
# 7 --> 0111
#result=0011 == 3 (outpunt)


#------ | Bit  -------
echo $((3 | 6))
# 3 --> 0011 (aplied | operation)
# 6 --> 0110
#result=0111 == 3 (output)


#------ |= Operator ------
var1=4
echo $((var1|=2))
# 4 --> 0100 (aplied | operation)
# 2 --> 0010
#result=0110 == 6 (output)
