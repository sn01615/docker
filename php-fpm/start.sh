#!/usr/bin/env bash
chown www-data:www-data -R /var/www/php/runtime
chown www-data:www-data -R /var/www/php/data
chown www-data:www-data -R /var/www/php/public/plugins/
chown www-data:www-data -R /var/www/php/public/themes/
chown www-data:www-data -R /var/www/php/public/upload/
cd /var/www/php && echo ...
#if [ ! -f '/var/www/php/composer' ]; then
#    echo "rm MY-docker-php-ext-xdebug.ini"
#    rm -f /usr/local/etc/php/conf.d/MY-docker-php-ext-xdebug.ini
#fi
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
