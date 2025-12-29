#!/bin/bash
# Artifact Cleanup Script
# Removes artifacts older than specified days

DAYS=${1:-30}
DRY_RUN=${2:-false}

echo "Cleaning artifacts older than $DAYS days..."

if [ "$DRY_RUN" = "--dry-run" ]; then
    echo "[DRY RUN] Would delete artifacts older than $DAYS days"
    find ./artifacts -type f -mtime +$DAYS -print
else
    find ./artifacts -type f -mtime +$DAYS -delete
    echo "Cleanup complete"
fi
