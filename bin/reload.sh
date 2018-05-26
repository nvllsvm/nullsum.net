#!/bin/sh
set -ex

PATH=$PATH:/opt/bin

cd ~/docker
docker-compose pull
docker-compose down -t 0 --remove-orphans -v
docker-compose up -d