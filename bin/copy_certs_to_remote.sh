#!/usr/bin/env sh
set -e

rsync -avz --progress --delete -e ssh ~/src/certs-nullsum.net/certs/ nullsum.net:'~/certs'
