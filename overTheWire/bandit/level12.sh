#!/bin/bash

xxd -r level12.hex > data.gzip

#decomplessor
name_compressed=&(7z l data.gzip | grep -A 2 Name | tail  -n 1 | awk NF{'print $NF'} > /dev/null)
7z x $name_compressed > /dev/null 2>&1
