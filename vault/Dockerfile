FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV VAULT_VERSION=0.5.1 \
    VAULT_MD5=7319b6514cb5ca735d9886d7b7e1ed8730ee38b238bb1626564436b824206d12

RUN apk add --no-cache ca-certificates libcap curl && \
    curl -Lo /vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    echo "${VAULT_MD5}  vault.zip" | sha256sum -c && \
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
