#!/usr/bin/with-contenv bash

if [ "$STARTUP_OPTIMIZE" -eq "1" ]; then
php /var/www/artisan optimize >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done optimize"
php /var/www/artisan view:cache >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done view cache"
php /var/www/artisan event:cache >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done event cache"
fi