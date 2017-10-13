#!/usr/bin/with-contenv bash
php /var/www/artisan config:clear >> /var/www/storage/logs/laravel.log 2>&1 || true
echo "Done config clear"