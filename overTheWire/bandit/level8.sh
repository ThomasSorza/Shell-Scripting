#!/bin/bash

#we need to use sort command in order to use the uniq command
cat data.txt | sort | uniq -u
