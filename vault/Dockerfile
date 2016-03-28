FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV VAULT_VERSION=0.5.2 \
    VAULT_SHA256=7517b21d2c709e661914fbae1f6bf3622d9347b0fe9fc3334d78a01d1e1b4ec2

RUN apk add --no-cache ca-certificates libcap curl && \
    curl -Lo vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    echo "${VAULT_SHA256}  vault.zip" | sha256sum -c && \
    mkdir -p /vault/etc && \
    mkdir /vault/data && \
    unzip vault.zip -d /usr/local/bin/ && \
    rm -f vault.zip && \
    apk del --purge curl

COPY conf/vault.json /vault/etc

VOLUME ["/vault"]

EXPOSE 8200

ENTRYPOINT ["vault"]
CMD ["server", "-config=/vault/etc/vault.json"]
