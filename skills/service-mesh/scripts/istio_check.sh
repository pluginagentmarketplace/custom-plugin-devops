#!/bin/bash
# Istio Service Mesh Health Check
echo "=== Istio Components ==="
kubectl get pods -n istio-system

echo "=== Virtual Services ==="
kubectl get virtualservices -A

echo "=== Destination Rules ==="
kubectl get destinationrules -A
