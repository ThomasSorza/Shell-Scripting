#!/bin/bash

diff passwords.old passwords.new | tail -n 1 | awk NF{'print $NF'}
#you will get the password for bandit 18
