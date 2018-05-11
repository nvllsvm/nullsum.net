#!/bin/bash
set -ex

rm -rf output
pipenv install --dev
pipenv run nikola build
rsync -avz --progress --delete -e ssh output/ nullsum.net:/srv/http/
