#!/bin/sh
set -ex

cd ~/docker
docker-compose pull
docker-compose down -t 0 --remove-orphans -v
docker-compose up -d
