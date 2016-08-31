FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV PACKER_VERSION=0.10.1 \
    PACKER_SHA=7d51fc5db19d02bbf32278a8116830fae33a3f9bd4440a58d23ad7c863e92e28

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    echo "${PACKER_SHA}  packer.zip" | sha256sum -c && \
    unzip packer.zip -d /usr/local/bin/ && \
    rm -f packer.zip && \
    apk del --purge curl

ENTRYPOINT ["packer"]
CMD ["--help"]
