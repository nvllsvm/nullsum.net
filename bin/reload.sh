#!/usr/bin/env sh
set -ex

alias docker-compose="$HOME/bin/docker-compose"

cd ~/docker
docker-compose pull
docker-compose down -t 0 --remove-orphans -v
docker-compose up -d
