#!/bin/bash
# System Health Check Script
# Usage: ./system-health-check.sh

set -e

echo "=========================================="
echo "       SYSTEM HEALTH CHECK REPORT        "
echo "=========================================="
echo "Date: $(date)"
echo ""

# CPU Usage
echo "=== CPU Usage ==="
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo ""

# Memory Usage
echo "=== Memory Usage ==="
free -h | head -2
echo ""

# Disk Usage
echo "=== Disk Usage ==="
df -h | grep -E '^/dev|Filesystem'
echo ""

# Top Processes
echo "=== Top 5 CPU Processes ==="
ps aux --sort=-%cpu | head -6
echo ""

# Network Connections
echo "=== Active Network Connections ==="
netstat -tuln 2>/dev/null | head -10 || ss -tuln | head -10
echo ""

# System Services
echo "=== Failed Services ==="
systemctl --failed 2>/dev/null || echo "systemctl not available"
echo ""

# Uptime
echo "=== System Uptime ==="
uptime
echo ""

echo "=========================================="
echo "         HEALTH CHECK COMPLETE           "
echo "=========================================="
