FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV LOGSTASH_VERSION=2.4.0 \
    PATH=$PATH:/logstash/bin/

COPY conf/entrypoint.sh /

RUN set -ex && \
    addgroup -S logstash && \
    adduser -S -D -s /sbin/nologin -G logstash logstash && \
    apk add --no-cache openjdk8-jre-base tar bash openssl && \
    wget https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    wget https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz.sha1.txt && \
    sha1sum -c logstash-${LOGSTASH_VERSION}.tar.gz.sha1.txt && \
    mkdir /logstash && \
    tar xzf logstash-${LOGSTASH_VERSION}.tar.gz -C /logstash --strip-components=1 && \
    chown -R logstash:logstash /logstash && \
    apk del --purge tar openssl && \
    rm -f *.tar.gz.*

USER logstash

COPY conf/logstash.conf /logstash/

VOLUME ["/logstash"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["logstash", "agent", "-f", "/logstash/logstash.conf" ]
