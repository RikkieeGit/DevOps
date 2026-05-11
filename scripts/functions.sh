#!/bin/bash

print_header() {
    echo "================================"
    echo "   $1"
    echo "================================"
}

check_memory() {
	FREE=$(free -h | awk 'NR==2 {print $4}')
	TOTAL=$(free -h | awk 'NR==2 {print $2}')
	echo "Memory -> Total: $TOTAL | Free: $FREE"
}

check_cpu() {
	CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,')
	echo "CPU usage -> $CPU%"
}

print_header "Memory Report"
check_memory

print_header "CPU Report"
check_cpu


