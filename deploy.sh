#!/bin/bash
set -ex

rm -rf output
pipenv install --dev
pipenv run nikola build
rsync -avz --progress --delete -e ssh output/ nullsum.net:site_deploy/
ssh nullsum.net rsync -rvz --progress --delete site_deploy/ /srv/http
ssh nullsum.net rm -rf site_deploy
