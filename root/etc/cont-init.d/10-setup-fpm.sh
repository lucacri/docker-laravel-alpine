#!/usr/bin/with-contenv bash

echo "pm.max_children = ${PHP_MAX_CHILDREN}" >> /etc/php7/php-fpm.d/www.conf