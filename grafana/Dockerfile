FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV GRAFANA_VERSION=v3.0.4

RUN set -ex && \
    addgroup -S grafana && \ 
    adduser -S -G grafana grafana && \
    export GOPATH=/go && \
    PATH=$PATH:$GOPATH/bin && \
    buildDeps="build-base nodejs go git python" && \
    apk add --no-cache $buildDeps ca-certificates openssl fontconfig && \
    mkdir -p ${GOPATH}/src/github.com/grafana && \
    cd ${GOPATH}/src/github.com/grafana && \
    git clone --branch ${GRAFANA_VERSION} https://github.com/grafana/grafana.git &&\
    cd grafana && \
    go run build.go setup && \
    godep restore && \
    go run build.go build && \
    npm install && \
    npm run build && \
    npm cache clear && \
    mkdir -p /grafana/dashboards && \
    mkdir /grafana/data && \
    mkdir /grafana/logs && \
    mkdir /grafana/plugins && \
    cp -a ${GOPATH}/src/github.com/grafana/grafana/bin/grafana-server /usr/local/bin/grafana-server && \
    cp -a ${GOPATH}/src/github.com/grafana/grafana/bin/grafana-cli /usr/local/bin/grafana-cli && \
    cp -ra ${GOPATH}/src/github.com/grafana/grafana/public_gen /grafana/public && \
    cp -ra ${GOPATH}/src/github.com/grafana/grafana/conf /grafana/conf && \
    cp -ra ${GOPATH}/src/github.com/grafana/grafana/vendor /grafana/ && \
    mkdir /var/lib/grafana/ && \
    ln -s /grafana/plugins /var/lib/grafana/plugins && \ 
    grafana-cli plugins install grafana-piechart-panel && \
    grafana-cli plugins install grafana-clock-panel && \
    grafana-cli plugins install raintank-worldping-app && \
    grafana-cli plugins install grafana-worldmap-panel && \
    grafana-cli plugins update-all && \
    go clean -i -r && \
    apk del --purge $buildDeps && \
    rm -rf /go /tmp/* /root/.n* && \
    chown -R grafana:grafana /grafana

USER grafana

COPY conf/defaults.ini /grafana/conf/

VOLUME  ["/grafana"]

EXPOSE 3000

ENTRYPOINT ["grafana-server", "--homepath=/grafana"]
