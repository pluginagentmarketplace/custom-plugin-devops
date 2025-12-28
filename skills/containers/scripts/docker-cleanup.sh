#!/bin/bash
echo "Docker cleanup..."
docker system prune -af --volumes
docker image prune -af
echo "Cleanup complete!"
