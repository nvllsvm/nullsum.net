#!/usr/bin/env sh
set -ex

find output -mindepth 1 -delete
pipenv install --dev
pipenv run nikola build
image_optim -r output
