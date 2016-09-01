FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TERRAFORM_VERSION=0.7.2 \
    TERRAFORM_SHA=b337c885526a8a653075551ac5363a09925ce9cf141f4e9a0d9f497842c85ad5

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA}  terraform.zip" | sha256sum -c && \
    unzip terraform.zip -d /usr/local/bin/ && \
    rm -f terraform.zip && \
    apk del --purge curl

ENTRYPOINT ["terraform"]
CMD ["--help"]
