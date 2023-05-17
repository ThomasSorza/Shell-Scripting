#!/bin/bash

base64 -d data.txt | awk '{print $NF}'
