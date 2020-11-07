#!/usr/bin/env sh
set -e

rsync -avz --progress --delete -e ssh ~/code/certs-nullsum.net/certs/ nullsum.net:'~/certs'
