#!/usr/bin/with-contenv bash

php /var/www/artisan route:clear >> /var/www/storage/logs/laravel.log 2>&1 || true

if [ "$STARTUP_ROUTE_CACHE" -eq "1" ]; then
php /var/www/artisan route:cache >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done route:cache"
fi