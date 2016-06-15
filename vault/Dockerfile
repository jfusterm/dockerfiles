FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV VAULT_VERSION=0.6.0 \
    VAULT_SHA256=283b4f591da8a4bf92067bf9ff5b70249f20705cc963bea96ecaf032911f27c2 \
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
