#!/bin/bash
#
# Rebuilds Docker based on the latest trade-executor master and restarts
#
set -e

cd deps/trade-executor
git checkout master  # Pull latest changes
git pull
cd ../..
git add deps/trade-executor
poetry update  # Rebuild Poetry lock file
git commit -m "Updated to the latest master"
git push

export COCALC_ENV_VERSION=local
docker build -t ghcr.io/tradingstrategy-ai/cocalc-env:$COCALC_ENV_VERSION .
docker compose up -d 
