#!/usr/bin/env bash
chown www-data:www-data -R /var/www/php/app/cache
cd /var/www/php && echo ...
if [ ! -f '/var/www/php/composer' ]; then
    echo "rm MY-docker-php-ext-xdebug.ini"
    rm -f /usr/local/etc/php/conf.d/MY-docker-php-ext-xdebug.ini
fi
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
