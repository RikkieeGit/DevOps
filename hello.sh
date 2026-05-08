#!/bin/bash

DISK_NUM=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $DISK_NUM -gt 80 ]; then
	echo "Status : CRITICAL - Disk almost full"
elif [ $DISK_NUM -gt 60 ]; then
	echo "Status : WARNING - Disk filling up"
else
	echo "Status : OK - Disk is healthy"
fi
