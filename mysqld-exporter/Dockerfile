FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV MYSQLD_EXPORTER_VERSION=0.7.1

RUN addgroup -S prometheus && adduser -S -G prometheus prometheus && \
    buildDeps="git go make" && \
    apk add --no-cache $buildDeps openssl ca-certificates && \
    export GOPATH=/go && \
    mkdir -p $GOPATH/src/github.com/prometheus && \
    cd $GOPATH/src/github.com/prometheus && \
    git clone --branch ${MYSQLD_EXPORTER_VERSION} https://github.com/prometheus/mysqld_exporter.git && \
    make -C mysqld_exporter && \
    cp mysqld_exporter/mysqld_exporter /usr/local/bin && \
    apk del --purge $buildDeps && \
    rm -rf /go

USER prometheus 

EXPOSE 9104

ENTRYPOINT ["mysqld_exporter"]
