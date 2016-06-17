FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV ELASTICSEARCH_VERSION=2.3.3 \
    PATH=$PATH:/elastic/bin/

RUN set -ex && \
    addgroup -S elastic && \
    adduser -S -D -s /sbin/nologin -G elastic elastic && \
    apk add --no-cache openjdk8-jre-base curl tar && \
    curl -Lo elastic.tar.gz https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ELASTICSEARCH_VERSION}/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz && \
    curl -Lo elastic.tar.gz.sha1 https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ELASTICSEARCH_VERSION}/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz.sha1 && \
    echo "$(cat elastic.tar.gz.sha1)  elastic.tar.gz" | sha1sum -c && \
    mkdir -p /elastic/data && \
    mkdir /elastic/logs && \
    tar xzf elastic.tar.gz -C /elastic --strip-components=1 && \
    chown -R elastic:elastic /elastic && \
    apk del --purge tar && \
    rm -f *.tar.gz.*

USER elastic

COPY conf/elasticsearch.yml /elastic/config

VOLUME ["/elastic"]

EXPOSE 9200 9300

ENTRYPOINT ["elasticsearch"]
