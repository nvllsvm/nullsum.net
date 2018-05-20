#!/bin/sh
set -ex

rm -rf output
pipenv install --dev
pipenv run nikola build
