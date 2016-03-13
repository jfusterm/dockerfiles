FROM jfusterm/alpine-glibc:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV INFLUXDB_VERSION=0.10.3 \
    INFLUXDB_MD5=d3bff79076cadd3a179a2778d048ef6c

RUN addgroup -S influxdb && adduser -S -G influxdb influxdb && \
    apk add --no-cache openssl ca-certificates tar curl && \
    curl -Lo influxdb.tar.gz https://s3.amazonaws.com/influxdb/influxdb-${INFLUXDB_VERSION}-1_linux_amd64.tar.gz && \
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
