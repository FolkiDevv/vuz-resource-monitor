#!/bin/bash

set -e

FREQUENCY=10
LOG_FILE=monitor.log

print_monitor() {
    date "+--- %Y-%m-%d %H:%M:%S ---"
    free -h
    df -h
    uptime
}

while true; do
    print_monitor >> $LOG_FILE
    sleep $FREQUENCY
done
