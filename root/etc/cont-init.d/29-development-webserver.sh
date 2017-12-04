#!/usr/bin/with-contenv bash

if [ "$DEVELOPMENT_WEBSERVER" -eq "1" ]; then
    echo "Starting development version of Caddy"
    cp /caddy/caddy-dev.conf /caddy.conf
fi