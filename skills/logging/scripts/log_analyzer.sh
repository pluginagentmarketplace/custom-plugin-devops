#!/bin/bash
# Log Analysis Script
LOG_FILE=${1:-/var/log/syslog}

echo "=== Error Analysis ==="
grep -i "error\|fail\|critical" "$LOG_FILE" | tail -20

echo "=== Log Statistics ==="
wc -l "$LOG_FILE"
