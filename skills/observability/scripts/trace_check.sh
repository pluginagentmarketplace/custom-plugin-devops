#!/bin/bash
# Observability Check - Jaeger/Zipkin traces
curl -s http://localhost:16686/api/services | jq '.data[]' 2>/dev/null || echo "Jaeger not available"
