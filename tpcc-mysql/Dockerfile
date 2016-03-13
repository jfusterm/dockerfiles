FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

RUN buildDeps="build-base git mariadb-dev" && \
    apk add --no-cache $buildDeps mariadb-libs && \
    git clone https://github.com/pingcap/tpcc-mysql.git && \
    make -C tpcc-mysql/src && \
    cp tpcc-mysql/tpcc_* /usr/local/bin && \
    apk del --purge $buildDeps && \
    rm -fr tpcc-mysql

CMD ["tpcc_start"]
