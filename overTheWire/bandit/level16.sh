#!/bin/bash

# -T5 is one of the most agressive modes (in a localhost it des not matter)

nmap --open -T5 -p31000-32000 127.0.0.1
openssl s_client -connect 127.0.0.1:[port speaks ssl]

#enter the $(cat /etc/bandit_pass/bandit16)
