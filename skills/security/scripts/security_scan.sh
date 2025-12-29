#!/bin/bash
# Basic Security Scan Script

echo "=== Open Ports ==="
netstat -tlnp 2>/dev/null || ss -tlnp

echo "=== Failed Login Attempts ==="
grep -i "failed" /var/log/auth.log 2>/dev/null | tail -10

echo "=== SUID Files ==="
find / -perm -4000 -type f 2>/dev/null | head -10
