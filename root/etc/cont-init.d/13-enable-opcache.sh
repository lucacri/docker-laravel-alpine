#!/usr/bin/with-contenv bash

if [ "$ENABLE_OPCACHE" -eq "1" ]; then
    echo "Enabling OPCache";
    rm /etc/php7/conf.d/31_opcache_dev.ini
else
    echo "Disabling OPCache";
    rm /etc/php7/conf.d/31_opcache.ini
fi