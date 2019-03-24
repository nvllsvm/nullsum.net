#!/usr/bin/env sh
set -ex

cd "$(dirname "$0")/.."

./bin/copy_certs_to_remote.sh
ssh nullsum.net '~/bin/reload.sh'
