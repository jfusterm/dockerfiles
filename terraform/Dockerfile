FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TERRAFORM_VERSION=0.7.5 \
    TERRAFORM_SHA256=7def82015b3a9a1bab13b4548e4c8d4ac960322a815cff7d9ebf76ef74a4cb34

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256}  terraform.zip" | sha256sum -c && \
    unzip terraform.zip -d /usr/local/bin/ && \
    rm -f terraform.zip && \
    apk del --purge curl

ENTRYPOINT ["terraform"]
CMD ["--help"]
