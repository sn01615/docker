FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    procps supervisor libzip-dev libgmp-dev \
    libcurl4-openssl-dev \
    libxml2-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mysqli gd zip bcmath gmp sockets \
    && docker-php-ext-enable opcache zip bcmath gmp sockets

RUN pecl install redis solr \
    && docker-php-ext-enable redis solr

RUN pecl install mongodb-1.4.4 \
    && docker-php-ext-enable mongodb

RUN pecl install xdebug-2.9.8 \
    && docker-php-ext-enable xdebug

WORKDIR /var/www/php
EXPOSE 39001

ENTRYPOINT ["/bin/bash", "/var/www/php/php-fpm/start.sh"]
