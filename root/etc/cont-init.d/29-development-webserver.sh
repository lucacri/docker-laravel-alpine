#!/usr/bin/with-contenv bash

if [ "$DEVELOPMENT_WEBSERVER" -eq "1" ]; then
    echo "Starting development version of Caddy"
    cp /caddy/caddy-dev.conf /caddy.conf

    if [ "$DEVELOPMENT_WEBSERVER_NO_SSL" -eq "1" ]; then
        echo "Starting development version of Caddy without SSL"
        cp /caddy/caddy-dev-no-ssl.conf /caddy.conf
    fi

fi