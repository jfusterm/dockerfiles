FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV ANSIBLE_VERSION=2.0.1.0

RUN set -ex && \
    buildDeps="python-dev build-base" && \
    apk add --no-cache $buildDeps python py-pip ca-certificates bash && \
    pip install --upgrade pip && \
    pip install ansible==${ANSIBLE_VERSION} && \
    apk del --purge $buildDeps

CMD ["ansible"]
