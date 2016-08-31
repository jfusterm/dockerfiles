FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV NGINX_VERSION=1.11.3

COPY conf/entrypoint.sh /

RUN addgroup -S nginx && \
    adduser -S -D -s /sbin/nologin -G nginx nginx && \
    buildDeps="build-base libaio-dev pcre-dev openssl-dev linux-headers gnupg zlib-dev geoip-dev" && \
    apk add --no-cache $buildDeps pcre openssl ca-certificates geoip && \
    wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz.asc && \
    gpg --keyserver pgpkeys.mit.edu --recv-key A1C052F8 && \
    gpg --verify nginx-${NGINX_VERSION}.tar.gz.asc && \
    rm -r ~/.gnupg && \
    mkdir -p /nginx/tmp && \
    mkdir -p /nginx/etc/conf.d && \
    tar xzf nginx-${NGINX_VERSION}.tar.gz && \
    cd nginx-${NGINX_VERSION} && \
    ./configure \
       --prefix=/nginx \
       --sbin-path=/usr/local/bin \
       --conf-path=/nginx/etc/nginx.conf \
       --error-log-path=/nginx/log/error.log \
       --http-log-path=/nginx/log/access.log \
       --pid-path=/nginx/run/nginx.pid \
       --lock-path=/nginx/run/nginx.lock \
       --http-client-body-temp-path=/nginx/tmp/client \
       --http-proxy-temp-path=/nginx/tmp/proxy \
       --http-fastcgi-temp-path=/nginx/tmp/fastcgi \
       --http-uwsgi-temp-path=/nginx/tmp/uwsgi \
       --http-scgi-temp-path=/nginx/tmp/scgi \
       --with-threads \
       --with-stream \
       --with-stream_ssl_module \
       --with-http_slice_module \
       --with-mail \
       --with-mail_ssl_module \
       --with-file-aio \
       --with-http_v2_module \
       --with-ipv6 \
       --with-http_ssl_module \
       --with-http_realip_module \
       --with-http_geoip_module \
       --with-http_addition_module \
       --with-http_sub_module \
       --with-http_dav_module \
       --with-http_flv_module \
       --with-http_mp4_module \
       --with-http_random_index_module \
       --with-http_secure_link_module \
       --with-http_stub_status_module \
       --with-http_auth_request_module \
       --with-http_gunzip_module \
       --with-http_gzip_static_module \
       --user=nginx \
       --group=nginx && \
    make && \
    make install && \
    cd .. && \
    rm -fr nginx-* && \
    chmod +x /entrypoint.sh && \
    apk del --purge $buildDeps

COPY conf/nginx.conf /nginx/etc

EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx" ,"-g" ,"daemon off;"]
