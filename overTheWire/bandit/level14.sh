#!/bin/bash

#check port
#cat /etc/bandit_pass/bandit14
#bash -c "echo '' > /dev/tcp/127.0.0.1/30000" 2>/dev/null && echo "Open Port" || echo "Closed Port"

echo $(cat /etc/bandit_pass/bandit14) | nc localhost 30000 | tail-n 2 | head -n 1

#telnet localhost 30000
#enter the password $(cat /etc/bandit_pass/bandit14)
