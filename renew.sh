#!/bin/bash -e

cd /home/ec2-user/Gysinge/

docker-compose stop

cd /opt/letsencrypt

echo "Use 'gysingebryggeri.se as host"

./letsencrypt-auto certonly --standalone --debug

cd /home/ec2-user/Gysinge/

mkdir -p ssl

cp /etc/letsencrypt/live/gysingebryggeri.se/privkey.pem ssl
cp /etc/letsencrypt/live/gysingebryggeri.se/fullchain.pem ssl

docker-compose build
docker-compose up -d
