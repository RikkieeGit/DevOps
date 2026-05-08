#!/bin/bash

# ================================
# Server Health Check Script
# Author: Rikkiee
# ================================

LOGFILE=~/scripts/healthchecker.log
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

print_header() {
    echo "================================"
    echo "   $1"
    echo "================================"
}


check_disk() {
	USAGE=$(df "$1" | awk 'NR==2 {print $5}' | tr -d '%')
	if [ "$USAGE" -gt 80 ]; then
		STATUS="CRITICAL"
	elif  [ "$USAGE" -gt 60 ]; then
		STATUS="WARNING"
	else
		STATUS="OK"
	fi
	echo "[$STATUS] Disk $1 is at $USAGE% usage"
}

check_memory() {
	FREE=$(free | awk 'NR==2 {print $4}')
	TOTAL=$(free | awk 'NR==2 {print $2}')
	PERCENT=$((FREE * 100 / TOTAL))
	if [ "$PERCENT" -lt 10 ]; then
		STATUS="CRITICAL"
	elif [ "$PERCENT" -lt 20 ]; then
		STATUS="WARNING"
	else
		STATUS="OK"
	fi
	echo "[$STATUS] Memory free: $PERCENT%"
}

check_cpu() {
	CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,')
	echo "[INFO] CPU usage: $CPU%"
}

check_services() {
	if systemctl is-active --quiet "$1"; then
		echo "[OK] $1 is running"
	else
		echo "[CRITICAL] $1 is NOT running"
	fi
}

{
print_header "Health Check - $TIMESTAMP"
check_disk "/"
check_disk "/tmp"
check_disk "/home"
check_memory
check_cpu
check_services "ssh"
check_services "docker"
print_header "Check Completed"
} | tee -a $LOGFILE
