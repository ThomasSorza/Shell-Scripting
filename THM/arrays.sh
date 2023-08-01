#!/bin/bash

transport=('car' 'train' 'bike' 'bus')
echo "transport {1} value:${transport[1]}"

unset transport[1]
echo "transport {1} was deleted"
transport[1]='trainride'
echo "transport {1} was replaced"
echo "transport {1}: ${transport[1]}"
echo "${transport[@]}"
