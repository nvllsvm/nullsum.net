#!/bin/bash
set -ex

rm -rf output
pipenv install --dev
pipenv run nikola build

rm -rf docker/content
mv output docker/content

cat > docker/reload.sh<<EOF
#!/bin/sh
set -ex
cd ~/docker
docker-compose pull
docker-compose down -t 0 --remove-orphans -v
docker-compose up -d
EOF

chmod +x docker/reload.sh

rsync -avz --progress --delete -e ssh docker/ nullsum.net:~/docker
ssh nullsum.net /home/draje/docker/reload.sh
