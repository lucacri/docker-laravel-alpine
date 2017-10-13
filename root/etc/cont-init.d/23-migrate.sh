#!/usr/bin/with-contenv bash

if [ "$STARTUP_MIGRATE" -eq "1" ]; then
   echo "Running migrations";
   php /var/www/artisan migrate --force >> /var/www/storage/logs/laravel.log 2>&1 || true
   echo "Done migrate"
fi