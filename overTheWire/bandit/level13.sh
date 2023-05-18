#!/bin/bash

ssh -i sshkey.private bandit14@localhost -p 2220
#once logged as bandit14
cat /etc/bandit_pass/bandit14
