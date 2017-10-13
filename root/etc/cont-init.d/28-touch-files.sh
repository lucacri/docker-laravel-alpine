#!/usr/bin/with-contenv bash
touch /var/www/storage/logs/laravel.log
touch /var/www/storage/logs/cron.log

touch /var/spool/cron/crontabs/*
