FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV CONSUL_VERSION=0.6.3 \
    CONSUL_SHA256=b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250 \
    CONSUL_UI_SHA256=93bbb300cacfe8de90fb3bd5ede7d37ae6ce014898edc520b9c96a676b2bbb72

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
