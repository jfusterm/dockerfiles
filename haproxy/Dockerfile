FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV HAPROXY_MAJOR=1.6 \
    HAPROXY_VERSION=1.6.5

RUN set -ex && \
    buildDeps="build-base pcre-dev linux-headers openssl-dev" && \
    apk add --no-cache $buildDeps pcre libpcre32 libssl1.0 && \
    wget http://www.haproxy.org/download/${HAPROXY_MAJOR}/src/haproxy-${HAPROXY_VERSION}.tar.gz && \
    wget http://www.haproxy.org/download/${HAPROXY_MAJOR}/src/haproxy-${HAPROXY_VERSION}.tar.gz.md5 && \
    md5sum -c haproxy-${HAPROXY_VERSION}.tar.gz.md5 && \
    tar xzf haproxy-${HAPROXY_VERSION}.tar.gz && \
    make -C haproxy-${HAPROXY_VERSION} \
        TARGET=linux2628 \
        USE_PCRE=1 \
        USE_OPENSSL=1 \
        USE_ZLIB=1 \
        USE_LIBCRYPT=1 \
        install && \
    apk del --purge $buildDeps && \
    rm -fr haproxy-* && \
    mkdir -p /haproxy/etc

VOLUME ["/haproxy"]

ENTRYPOINT ["haproxy"]
CMD ["-f","/haproxy/etc/haproxy.cfg"]
