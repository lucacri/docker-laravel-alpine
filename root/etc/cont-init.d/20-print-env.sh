#!/usr/bin/with-contenv bash
mkdir -p /var/www/storage/logs

printenv | grep -v " " > /var/www/.env
if [ -e /var/www/version.txt ]
then
    version=$(head -n 1 /var/www/version.txt)
    echo "APP_VERSION=$version" >> /var/www/.env
    echo "CODE VERSION=$version"
fi 
