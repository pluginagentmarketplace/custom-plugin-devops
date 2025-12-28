#!/bin/bash
# Simple port scanner
HOST=${1:-localhost}
echo "Scanning $HOST..."
for port in 22 80 443 3306 5432 6379 8080 9090; do
    (echo >/dev/tcp/$HOST/$port) 2>/dev/null && echo "Port $port: OPEN"
done
