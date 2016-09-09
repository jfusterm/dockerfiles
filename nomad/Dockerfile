FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV NOMAD_VERSION=0.4.1 \
    NOMAD_SHA256=0cdb5dd95c918c6237dddeafe2e9d2049558fea79ed43eacdfcd247d5b093d67

COPY conf/entrypoint.sh /

RUN set -ex && \
    apk add --no-cache ca-certificates openssl curl && \
    curl -Lo nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    echo "${NOMAD_SHA256}  nomad.zip" | sha256sum -c && \
    mkdir -p /nomad/etc && \
    mkdir /nomad/data && \
    unzip nomad.zip -d /usr/local/bin/ && \
    rm -f nomad.zip && \
    apk del --purge curl && \
    chmod +x entrypoint.sh

COPY conf/*.hcl /nomad/etc/

VOLUME ["/nomad"]

# http
EXPOSE 4646 
# rpc
EXPOSE 4647
# serf
EXPOSE 4648 4648/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nomad","agent","-server","-bootstrap-expect=1","-config","/nomad/etc/server.hcl"]
