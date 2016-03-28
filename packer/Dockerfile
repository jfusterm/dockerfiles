FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV PACKER_VERSION=0.10.0 \
    PACKER_SHA=eadd33bc0f8fa42034059fc1cda5f43ed6f540746e767480f0706ebed49b45e5

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    echo "${PACKER_SHA}  packer.zip" | sha256sum -c && \
    unzip packer.zip -d /usr/local/bin/ && \
    rm -f packer.zip && \
    apk del --purge curl

ENTRYPOINT ["packer"]
CMD ["--help"]
