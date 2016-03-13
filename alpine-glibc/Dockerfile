FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV GLIBC_PKG_VERSION=2.23-r1

RUN buildDeps="openssl ca-certificates curl" && \
    apk add --no-cache $buildDeps && \
    curl -Lo /etc/apk/keys/andyshinn.rsa.pub https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/andyshinn.rsa.pub && \
    curl -Lo glibc.apk https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk && \
    curl -Lo glibc-bin.apk https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-bin-${GLIBC_PKG_VERSION}.apk && \
    apk add --no-cache glibc.apk glibc-bin.apk && \
    apk del --purge $buildDeps && \
    rm -f glibc* && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

CMD ["/bin/sh"]
