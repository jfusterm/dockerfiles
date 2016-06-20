FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV PHP_VERSION=7.0.7 \
    PHP_SHA256=9cc64a7459242c79c10e79d74feaf5bae3541f604966ceb600c3d2e8f5fe4794 \
    PATH=$PATH:/php/bin:/php/sbin

RUN set -ex && \
    addgroup -S php && \ 
    adduser -S -D -s /sbin/nologin -G php php && \
    buildDeps="build-base libxml2-dev openssl-dev curl-dev readline-dev gd-dev libpng-dev libmcrypt-dev bison recode-dev" && \
    apk add --no-cache $buildDeps libxml2 curl gd readline openssl libmcrypt libpng recode && \
    curl -Lo php.tar.xz http://php.net/get/php-${PHP_VERSION}.tar.xz/from/this/mirror && \
    echo "${PHP_SHA256}  php.tar.xz" | sha256sum -c && \
    mkdir -p /php/conf.d && \
    mkdir /php/etc && \
    tar xJf php.tar.xz && \
    cd php-${PHP_VERSION} && \
    ./configure \
       --prefix=/php \
       --enable-opcache \
       --enable-fpm \
       --enable-mysqlnd \
       --enable-mbstring \
       --enable-soap \
       --enable-sockets \
       --disable-cgi \
       --with-curl \
       --with-gd \
       --with-mcrypt \
       --with-openssl \
       --with-readline \
       --with-recode \
       --with-zlib \
       --with-fpm-user=php \
       --with-fpm-group=php \
       --with-config-file-path=/php/etc \
       --with-config-file-scan-dir=/php/conf.d && \
    make && \
    make install && \
    cd ..  && \
    rm -fr *.apk php.* php-* && \
    chown -R php:php /php && \
    apk del --purge $buildDeps

USER php

COPY conf/php-fpm.conf /php/etc
COPY conf/www.conf /php/etc/php-fpm.d
COPY conf/opcache.ini /php/conf.d

EXPOSE 9000

CMD ["php-fpm"]
