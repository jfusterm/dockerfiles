FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV GRAFANA_VERSION=v2.6.0

RUN addgroup -S grafana && adduser -S -G grafana grafana && \
    export GOPATH=/go && \
    PATH=$PATH:$GOPATH/bin && \
    buildDeps="build-base nodejs go git" && \
    apk add --no-cache $buildDeps ca-certificates openssl && \
    mkdir -p ${GOPATH}/src/github.com/grafana && \
    cd ${GOPATH}/src/github.com/grafana && \
    git clone --branch ${GRAFANA_VERSION} https://github.com/grafana/grafana.git &&\
    cd grafana && \
    go run build.go setup && \
    godep restore && \
    go run build.go build && \
    npm install && \
    npm install -g grunt-cli && \
    cd ${GOPATH}/src/github.com/grafana/grafana/node_modules/karma-phantomjs-launcher/node_modules/phantomjs && \
    node install && \
    cd ${GOPATH}/src/github.com/grafana/grafana && \
    grunt && \
    npm uninstall -g grunt-cli && \
    npm cache clear && \
    mkdir -p /grafana/dashboards && \
    mkdir /grafana/data && \
    mkdir /grafana/logs && \
    cp -a ${GOPATH}/src/github.com/grafana/grafana/bin/grafana-server /usr/local/bin/grafana-server && \
    cp -ra ${GOPATH}/src/github.com/grafana/grafana/public_gen /grafana/public && \
    cp -ra ${GOPATH}/src/github.com/grafana/grafana/conf /grafana/conf && \
    go clean -i -r && \
    apk del --purge $buildDeps && \
    rm -rf /go /tmp/* /root/.n* /usr/local/bin/phantomjs && \
    chown -R grafana:grafana /grafana

USER grafana

COPY conf/defaults.ini /grafana/conf/

VOLUME  ["/grafana"]

EXPOSE 3000

ENTRYPOINT ["grafana-server", "--homepath=/grafana"]
