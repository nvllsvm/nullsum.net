#!/bin/sh
set -ex

ssh-copy-id -i ~/.ssh/nullsum.net core@nullsum.net
ssh -i ~/.ssh/nullsum.net core@nullsum.net '~/bin/install_docker_compose_coreos.sh'
ssh -i ~/.ssh/nullsum.net core@nullsum.net sudo systemctl enable docker
