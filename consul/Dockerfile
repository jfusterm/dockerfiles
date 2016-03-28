FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV CONSUL_VERSION=0.6.4 \
    CONSUL_SHA256=abdf0e1856292468e2c9971420d73b805e93888e006c76324ae39416edcf0627 \
    CONSUL_UI_SHA256=5f8841b51e0e3e2eb1f1dc66a47310ae42b0448e77df14c83bb49e0e0d5fa4b7

RUN addgroup -S consul && adduser -S -G consul consul && \
    apk add --no-cache ca-certificates openssl curl && \
    curl -Lo consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    curl -Lo webui.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip && \
    echo "${CONSUL_SHA256}  consul.zip" | sha256sum -c && \
    echo "${CONSUL_UI_SHA256}  webui.zip" | sha256sum -c && \
    mkdir -p /consul/etc && \
    mkdir /consul/data && \
    mkdir /consul/ui && \
    unzip consul.zip -d /usr/local/bin/ && \
    unzip webui.zip -d /consul/ui && \
    rm -f consul.zip webui.zip && \
    apk del --purge curl && \
    chown -R consul:consul /consul

USER consul

COPY conf/consul.json /consul/etc

VOLUME ["/consul"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600/udp

ENTRYPOINT ["consul"]
CMD ["agent","-server","-client=0.0.0.0","-config-file=/consul/etc/consul.json"]
