#!/usr/bin/env sh
set -ex
apk update
apk upgrade --no-cache

rm -f /etc/motd

cat >> /etc/ssh/sshd_config << EOF
ChallengeResponseAuthentication no
PasswordAuthentication no
EOF
service sshd restart

apk add docker docker-cli-compose rsync
rc-update add docker boot
service docker start

cat > ~/.profile << EOF
export COMPOSE_FILE=~/docker/docker-compose.yml
EOF

. ~/.profile

docker compose pull
docker compose down --remove-orphans --volumes
docker compose up -d

docker system prune --all --force --volumes
