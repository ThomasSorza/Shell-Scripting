#! /bin/bash

find / -user bandit7 -size 33c -group bandit6 2>/dev/null | xargs cat
