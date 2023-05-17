#!/bin/bash

file inhere/* | grep ASCII -m 1 | sed 's/:/ /'| awk '{print $1}' | xargs cat
