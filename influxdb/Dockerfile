FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV INFLUXDB_VERSION=1.0.0 \
    INFLUXDB_MD5=504f8e9c9239689bc67edae0edd7ea3b

RUN set -ex && \
    addgroup -S influxdb && \
    adduser -S -G influxdb influxdb && \
    apk add --no-cache openssl ca-certificates tar curl && \
    curl -Lo influxdb.tar.gz https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_amd64.tar.gz && \
    echo "${INFLUXDB_MD5}  influxdb.tar.gz" | md5sum -c && \
    mkdir -p /influxdb/etc && \
    mkdir /influxdb/ssl && \
    tar xzf influxdb.tar.gz -C /usr/local/bin "./influxdb-${INFLUXDB_VERSION}-1/usr/bin/" --strip-components=4 && \
    rm -f influxdb.tar.gz && \
    apk del --purge tar curl && \
    chown -R influxdb:influxdb /influxdb

USER influxdb

COPY conf/influxdb.conf /influxdb/etc

VOLUME ["/influxdb"]

EXPOSE 8083 8086 2003 

ENTRYPOINT ["influxd", "-config=/influxdb/etc/influxdb.conf"]
