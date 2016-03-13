FROM alpine:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV STRESS_VERSION=1.0.4

RUN wget -O stress.tar.gz http://people.seas.harvard.edu/~apw/stress/stress-${STRESS_VERSION}.tar.gz && \
    wget -O stress.tar.gz.sign http://people.seas.harvard.edu/~apw/stress/stress-${STRESS_VERSION}.tar.gz.sign && \
    buildDeps="gnupg build-base" && \
    apk add --no-cache $buildDeps && \
    gpg --keyserver pgpkeys.mit.edu --recv-key 0485EFCD && \
    gpg --verify stress.tar.gz.sign && \
    tar xzf stress.tar.gz && \
    cd stress-${STRESS_VERSION} && \
    ./configure && \
    make && \
    cp src/stress /usr/local/bin/ && \
    cd / && \
    rm -fr stress* && \
    apk del --purge $buildDeps

ENTRYPOINT ["stress"]
CMD ["--help"]
