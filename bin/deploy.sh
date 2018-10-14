#!/usr/bin/env sh
set -ex

./bin/copy_to_remote.sh
ssh nullsum.net '~/bin/reload.sh'
