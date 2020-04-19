#!/usr/bin/env sh
set -ex
cd "$(dirname "$0")/.."
./bin/copy_to_remote.sh
ssh nullsum.net '~/bin/reload.sh'
