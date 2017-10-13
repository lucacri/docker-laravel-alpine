#!/usr/bin/with-contenv bash

if [ "$ENABLE_CADDY" -eq "1" ]; then
   echo "Enabling Caddy Server";
   cp -Rv /etc/possible-services/caddy /etc/services.d/
fi

if [ "$ENABLE_CRON" -eq "1" ]; then
   echo "Enabling Cron";
   cp -Rv /etc/possible-services/cron /etc/services.d/
fi

if [ "$ENABLE_FPM" -eq "1" ]; then
   echo "Enabling FPM Server";
   cp -Rv /etc/possible-services/phpfpm /etc/services.d/
fi

if [ "$ENABLE_LOGS" -eq "1" ]; then
   echo "Enabling Logs";
   cp -Rv /etc/possible-services/logs /etc/services.d/
fi
