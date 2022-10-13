FROM rockylinux:8

COPY php-7.1.33.tar.bz2 /usr/src/php-7.1.33.tar.bz2

RUN dnf update -y && dnf install -y wget bzip2 gcc libxml2-devel sqlite-devel dnf-utils epel-release procps \
    openssl-devel libcurl-devel gmp-devel findutils make autoconf libpng-devel libjpeg-devel libXpm-devel \
    freetype-devel \
    && cd /usr/src \
    && tar jxf php-7.1.33.tar.bz2

RUN cd /usr/src/php-7.1.33 \
    && dnf install --enablerepo=powertools -y oniguruma-devel supervisor libmcrypt-devel

#RUN dnf install -y
RUN cd /usr/src/php-7.1.33 \
    && ./configure --prefix=/usr/local --with-config-file-path=/usr/local/etc/php --with-mysqli --with-pdo-mysql --enable-mbstring --enable-fpm --with-gd --with-curl --with-mcrypt \
    --with-openssl --with-freetype-dir --with-zlib --with-jpeg-dir --with-png-dir --with-xpm-dir --enable-pcntl \
    --with-gmp --enable-zip --enable-bcmath --enable-sockets \
    && make \
    && make install \
    && cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf

RUN groupadd www-data && useradd -M www-data -g www-data

RUN pecl install redis solr mongodb-1.4.4
RUN pecl install xdebug-2.9.8

WORKDIR /var/www/php
EXPOSE 39001

ENTRYPOINT ["/bin/bash", "/var/www/php/php-fpm/start.sh"]
