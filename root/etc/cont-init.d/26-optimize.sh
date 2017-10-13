#!/usr/bin/with-contenv bash

if [ "$STARTUP_OPTIMIZE" -eq "1" ]; then
php /var/www/artisan optimize --force >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done optimize"

fi