#!/bin/bash

#-----------(-p) Operator
pipe_test()
{
[ -p /dev/fd/0 ] && echo "File is a pipe" || echo "File is not a pipe"
}
echo "Hello" | pipe_test
#used to check if a file is a pipe or not.
