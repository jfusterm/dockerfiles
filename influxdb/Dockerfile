FROM jfusterm/alpine-glibc:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV INFLUXDB_VERSION=0.12.0 \
    INFLUXDB_MD5=4f10ac32d659623dc88e2da9096b41c1

RUN addgroup -S influxdb && adduser -S -G influxdb influxdb && \
    apk add --no-cache openssl ca-certificates tar curl && \
    curl -Lo influxdb.tar.gz https://s3.amazonaws.com/influxdb/influxdb-${INFLUXDB_VERSION}-1_linux_amd64.tar.gz && \
    echo "${INFLUXDB_MD5}  influxdb.tar.gz" | md5sum -c && \
    mkdir -p /influxdb/etc && \
    mkdir /influxdb/ssl && \
    tar xzf influxdb.tar.gz -C /usr/local/bin "./usr/bin/" --strip-components=3 && \
    rm -f influxdb.tar.gz && \
    apk del --purge tar curl && \
    chown -R influxdb:influxdb /influxdb

USER influxdb

COPY conf/influxdb.conf /influxdb/etc

VOLUME ["/influxdb"]

EXPOSE 8083 8086 2003 

ENTRYPOINT ["influxd", "-config=/influxdb/etc/influxdb.conf"]
