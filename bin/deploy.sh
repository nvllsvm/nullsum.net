#!/bin/sh
set -ex

rsync -avz --progress --delete -e ssh bin/ nullsum.net:'~/bin'
rsync -avz --progress --delete -e ssh certs/ nullsum.net:'~/certs'
rsync -avz --progress --delete -e ssh docker/ nullsum.net:'~/docker'
rsync -avz --progress --delete -e ssh output/ nullsum.net:'~/content'

ssh nullsum.net '~/bin/reload.sh'
