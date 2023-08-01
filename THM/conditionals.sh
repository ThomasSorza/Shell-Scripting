#!/bin/bash

filename=$1

if [ -f "$filename" ] && [ -w "$filename" ]
then
  echo "hello" >> $filename
else
  echo touch "$filename"
  echo "hello" >> $filename
fi
