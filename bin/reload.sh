#!/usr/bin/env sh
set -ex

cd ~/docker
docker-compose pull
docker-compose down --remove-orphans -v
docker-compose up -d
