#!/bin/bash

cat data.txt | grep millionth | awk '{print $NF}'
