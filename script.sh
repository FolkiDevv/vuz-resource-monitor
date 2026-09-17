#!/usr/bin/env bash

set -e

FREQUENCY=10
LOG_FILE=monitor.log

print_monitor() {
    date "+--- %Y-%m-%d %H:%M:%S ---"
    free -h
    df -h
    uptime
}

require_cmd() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Ошибка: команда '$1' не найдена" >&2
        exit 1
    fi
}

require_cmd free
require_cmd df
require_cmd uptime

while true; do
    print_monitor >> $LOG_FILE
    sleep $FREQUENCY
done
