#!/usr/bin/env sh
set -e

rsync -avz --progress --delete -e ssh ~/src/git.nullsum.net/nvllsvm/certs-nullsum.net/certs/ nullsum.net:'~/certs'
