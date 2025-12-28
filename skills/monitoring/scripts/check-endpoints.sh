#!/bin/bash
ENDPOINTS="http://localhost:9090 http://localhost:3000 http://localhost:9093"
for url in $ENDPOINTS; do
    status=$(curl -s -o /dev/null -w "%{http_code}" $url)
    echo "$url: $status"
done
