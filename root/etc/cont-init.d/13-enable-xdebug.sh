#!/usr/bin/with-contenv bash

rm /etc/php7/conf.d/00_xdebug.ini

if [ "$ENABLE_XDEBUG" -eq "1" ]; then
    echo "Enabling XDebug";

    echo "zend_extension=xdebug" > /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_enable=1" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.max_nesting_level=700" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_autostart=1" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_host=${XDEBUG_REMOTE_HOST}" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_port=9000" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_handler=dbgp" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.remote_connect_back=0" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.profiler_enable=0" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.idekey=${XDEBUG_IDE_KEY}" >> /etc/php7/conf.d/00_xdebug.ini
    echo "xdebug.extended_info=1" >> /etc/php7/conf.d/00_xdebug.ini
fi