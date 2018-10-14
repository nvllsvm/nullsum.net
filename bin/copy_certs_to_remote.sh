#!/usr/bin/env sh
set -ex

rsync -avz --progress --delete -e ssh ~/Code/GitLab/nvllsvm/certs-nullsum.net/certs/ nullsum.net:'~/certs'
