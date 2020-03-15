#!/usr/bin/env sh
set -ex
rsync -avz --progress --delete -e ssh public/ nullsum.net:'~/content'
