FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV PROMETHEUS_VERSION=0.20.0

RUN set -ex && \
    addgroup -S prometheus && \
    adduser -S -G prometheus prometheus && \
    buildDeps="git go bash make" && \
    apk add --no-cache $buildDeps openssl ca-certificates && \
    export GOPATH=/go && \
    mkdir -p $GOPATH/src/github.com/prometheus && \
    cd $GOPATH/src/github.com/prometheus && \
    git clone --branch ${PROMETHEUS_VERSION} https://github.com/prometheus/prometheus.git && \
    make -C prometheus build && \
    cp prometheus/prometheus prometheus/promtool /usr/local/bin && \
    mkdir -p /prometheus/etc && \
    mkdir /prometheus/data && \
    apk del --purge $buildDeps && \
    cd / && \
    rm -rf go && \
    chown -R prometheus:prometheus /prometheus

USER prometheus 

COPY conf/prometheus.yml /prometheus/etc

VOLUME ["/prometheus"]

EXPOSE 9090

ENTRYPOINT ["prometheus"]
CMD ["-config.file=/prometheus/etc/prometheus.yml", \
     "-storage.local.path=/prometheus/data", \
     "-web.console.libraries=/prometheus/console_libraries", \
     "-web.console.templates=/prometheus/consoles"]
