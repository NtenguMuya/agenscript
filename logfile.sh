#!/bin/bash

#Description: Delete logfile 14 days old
#Author :Serge
#Date : sept 2020

echo -e "\n Deleting files 14 days older\n"

find /var/log -name '*.log' -mtime +14 -exec rm {} \;

exit 0
