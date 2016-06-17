FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV KIBANA_VERSION=4.5.1 \
    PATH=$PATH:/kibana/bin/

COPY conf/entrypoint.sh /

RUN set -ex && \
    addgroup -S kibana && \
    adduser -S -D -s /sbin/nologin -G kibana kibana && \
    apk add --no-cache libstdc++ tar curl && \
    curl -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    curl -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz.sha1.txt && \
    sha1sum -c kibana-${KIBANA_VERSION}-linux-x64.tar.gz.sha1.txt && \
    mkdir /kibana && \
    tar xzf kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C /kibana --strip-components=1 && \
    chown -R kibana:kibana /kibana && \
    apk del --purge tar && \
    rm -f *.tar.gz.*

USER kibana

COPY conf/kibana.yml /kibana/config

VOLUME ["/kibana"]

EXPOSE 5601

ENTRYPOINT ["/entrypoint.sh"]
CMD ["kibana"]
