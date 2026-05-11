#!/bin/bash

echo "=== Disk Usage Report ==="
for DIR in / /tmp /home; do
	USAGE=$(df $DIR | awk 'NR==2 {print $5}' | tr -d '%')

	if [ "$USAGE" -gt 80 ]; then
	STATUS='CRITICAL'
	elif [ "$USAGE" -gt 60 ]; then
	STATUS='WARNING'
	else
	STATUS='OK'
	fi

	echo "[$STATUS] $DIR is at $USAGE% usage"
done
