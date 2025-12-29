#!/bin/bash
# Git Branch Cleanup Script
echo "=== Merged Branches ==="
git branch --merged | grep -v "main\|master\|develop"

echo "=== Prune Remote ==="
git remote prune origin --dry-run

echo "=== Stale Branches (>30 days) ==="
git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'
