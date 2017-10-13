#!/usr/bin/with-contenv bash

if [ "$STARTUP_CONFIG_CACHE" -eq "1" ]; then
  php /var/www/artisan config:cache >> /var/www/storage/logs/laravel.log 2>&1 || true
  echo "Done config:cache"
fi