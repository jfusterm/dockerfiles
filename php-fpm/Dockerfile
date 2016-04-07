FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV PHP_VERSION=7.0.5 \
    PHP_SHA256=c41f1a03c24119c0dd9b741cdb67880486e64349fc33527767f6dc28d3803abb \
    PATH=$PATH:/php/bin:/php/sbin

RUN set -ex && \
    addgroup -S php && \ 
    adduser -S -D -s /sbin/nologin -G php php && \
    buildDeps="build-base libxml2-dev openssl-dev curl-dev readline-dev gd-dev libpng-dev libmcrypt-dev bison" && \
    apk add --no-cache $buildDeps libxml2 curl gd readline openssl libmcrypt libpng && \
    curl -Lo recode.apk http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/recode-3.6-r1.apk && \
    curl -Lo recode-dev.apk http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/recode-dev-3.6-r1.apk && \
    apk add --no-cache recode.apk recode-dev.apk && \
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
    apk del --purge $buildDeps recode-dev

USER php

COPY conf/php-fpm.conf /php/etc
COPY conf/www.conf /php/etc/php-fpm.d
COPY conf/opcache.ini /php/conf.d

EXPOSE 9000

CMD ["php-fpm"]
