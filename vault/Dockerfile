FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV VAULT_VERSION=0.6.2 \
    VAULT_SHA256=91432c812b1264306f8d1ecf7dd237c3d7a8b2b6aebf4f887e487c4e7f69338c \
    PATH=$PATH:/vault/bin

RUN apk add --no-cache ca-certificates curl && \
    curl -Lo vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    echo "${VAULT_SHA256}  vault.zip" | sha256sum -c && \
    mkdir -p /vault/etc && \
    mkdir /vault/bin && \
    mkdir /vault/data && \
    unzip vault.zip -d /vault/bin/ && \
    rm -f vault.zip && \
    apk del --purge curl

COPY conf/vault.hcl /vault/etc

VOLUME ["/vault"]

EXPOSE 8200

ENTRYPOINT ["vault"]
CMD ["server", "-config=/vault/etc/vault.hcl"]
