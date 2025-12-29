#!/bin/bash
# ArgoCD Sync Status Check
argocd app list -o wide
argocd app get "$1" --show-operation 2>/dev/null || echo "App not found"
