#!/usr/bin/env sh
set -ex

cd ~/docker
docker compose pull
docker compose down --remove-orphans --volumes --timeout 0
docker compose up -d
