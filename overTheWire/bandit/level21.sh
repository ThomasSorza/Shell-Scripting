#!/bin/bash

cat /etc/cron.d/cronjob_bandit22 | head -n 1 | awk NF'{print $3}' | xargs cat | tail -n 1 | awk NF'{print $NF}' | xargs cat

