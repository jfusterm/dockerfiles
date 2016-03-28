FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TERRAFORM_VERSION=0.6.14 \
    TERRAFORM_SHA=6d93290f980df15a453e907ea9a2ca8f8fed41143c220953c911b5174c3e3ab0

RUN set -ex && \
    apk add --no-cache ca-certificates curl && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA}  terraform.zip" | sha256sum -c && \
    unzip terraform.zip -d /usr/local/bin/ && \
    rm -f terraform.zip && \
    apk del --purge curl

ENTRYPOINT ["terraform"]
CMD ["--help"]
