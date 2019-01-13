#!/usr/bin/env sh
set -ex

if [ -d output ]; then
    find output -mindepth 1 -delete
fi
pipenv install --dev
pipenv run nikola build
image_optim -r output
