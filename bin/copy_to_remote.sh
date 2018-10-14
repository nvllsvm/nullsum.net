#!/usr/bin/env sh
set -ex

ssh nullsum.net mkdir -p "~/certs"
rsync -avz --progress --delete -e ssh bin/ nullsum.net:'~/bin'
rsync -avz --progress --delete -e ssh docker/ nullsum.net:'~/docker'
rsync -avz --progress --delete -e ssh output/ nullsum.net:'~/content'
