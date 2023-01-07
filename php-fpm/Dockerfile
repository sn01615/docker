FROM rockylinux:8

COPY php-7.1.33.tar.bz2 /usr/src/php-7.1.33.tar.bz2

RUN dnf update -y && dnf install -y wget bzip2 gcc gcc-c++ libxml2-devel sqlite-devel dnf-utils epel-release procps \
    openssl-devel libcurl-devel gmp-devel findutils make autoconf libpng-devel libjpeg-devel libXpm-devel \
    freetype-devel git \
    && dnf install --enablerepo=powertools -y ImageMagick-devel hiredis-devel re2c oniguruma-devel supervisor \
    libmcrypt-devel
RUN cd /usr/src && tar jxf php-7.1.33.tar.bz2 && cd /usr/src/php-7.1.33 \
    && ./configure --prefix=/usr/local --with-config-file-path=/usr/local/etc/php --with-mysqli --with-pdo-mysql \
        --enable-mbstring --enable-fpm --with-gd --with-curl \
        --with-openssl --with-freetype-dir --with-zlib --with-jpeg-dir --with-png-dir --with-xpm-dir --enable-pcntl \
        --with-gmp --enable-zip --enable-bcmath --enable-sockets \
    && make && make install \
    && pecl channel-update pecl.php.net \
    && pecl install redis solr mongodb mcrypt imagick \
    && git clone https://github.com/nrk/phpiredis.git \
    && cd phpiredis \
    && phpize && ./configure --enable-phpiredis \
    && make && make install \
    && cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf \
    && groupadd www-data && useradd -M www-data -g www-data \
    && rm -rf /usr/src/php-7.1.33 \
    && dnf clean all \
    && pecl clear-cache
#RUN pecl install swoole-4.8.12 \
#    && pecl clear-cache
RUN pecl install xdebug-2.9.8 \
    && pecl clear-cache
RUN dnf install -y zip

WORKDIR /var/www/php
EXPOSE 39001

ENTRYPOINT ["/bin/bash", "/var/www/php/docker/php-fpm/start.sh"]
