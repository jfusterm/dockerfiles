FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TERRAFORM_VERSION=0.7.0 \
    TERRAFORM_SHA=a196c63b967967343f3ae9bb18ce324a18b27690e2d105e1f38c5a2d7c02038d

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA}  terraform.zip" | sha256sum -c && \
    unzip terraform.zip -d /usr/local/bin/ && \
    rm -f terraform.zip && \
    apk del --purge curl

ENTRYPOINT ["terraform"]
CMD ["--help"]
