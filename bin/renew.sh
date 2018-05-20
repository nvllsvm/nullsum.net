#!/bin/sh
set -e

DOMAIN=nullsum.net
EMAIL=ar@nullsum.net

CERTBOT_DIR=./certs/certbot
PEM_DIR=./certs/pem
AUTH_SCRIPT=$CERTBOT_DIR/auth.sh

CERT_DHPARM=$PEM_DIR/dhparam.pem
CERT_FULLCHAIN=$PEM_DIR/fullchain.pem
CERT_PRIVKEY=$PEM_DIR/privkey.pem

WELL_KNOWN_DIR=./certs/renewal/.well-known
ACME_DIR=$WELL_KNOWN_DIR/acme-challenge

trap "cleanup" EXIT
cleanup() {
    rm -rf $WELL_KNOWN_DIR
}

mkdir -p $PEM_DIR ./certs/renewal

rm -rf $CERTBOT_DIR
mkdir -p $CERTBOT_DIR

if [ ! -f $CERT_DHPARM ]; then
    openssl dhparam -out $CERT_DHPARM 2048
fi

cat > $AUTH_SCRIPT<<EOF
#!/bin/sh
mkdir -p $ACME_DIR
echo \$CERTBOT_VALIDATION > $ACME_DIR/\$CERTBOT_TOKEN
rsync -avz --progress --delete -e ssh ./certs/renewal/ nullsum.net:~/certs/renewal
EOF
chmod +x $AUTH_SCRIPT

certbot certonly \
    -n \
    -d $DOMAIN \
    --manual \
    --manual-auth-hook $AUTH_SCRIPT \
    --config-dir $CERTBOT_DIR/config \
    --logs-dir $CERTBOT_DIR/logs \
    --work-dir $CERTBOT_DIR/work \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --email $EMAIL

LIVE_DIR=$CERTBOT_DIR/config/live/$DOMAIN
cp -L $LIVE_DIR/fullchain.pem $CERT_FULLCHAIN
cp -L $LIVE_DIR/privkey.pem $CERT_PRIVKEY

rsync -avz --progress --delete -e ssh certs/pem/ nullsum.net:~/certs/pem

rsync -avz --progress --delete -e ssh bin/ nullsum.net:~/bin
ssh nullsum.net /home/draje/bin/reload.sh

rm -rf $CERTBOT_DIR
rm -rf $WELL_KNOWN_DIR

rsync -avz --progress --delete -e ssh ./certs/renewal/ nullsum.net:~/certs/renewal
