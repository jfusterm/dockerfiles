FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TELEGRAF_VERSION=1.0.0 \
    TELEGRAF_MD5=c3e2562a81dec8ecc9696b263d05d249

RUN set -ex && \
    addgroup -S telegraf && \
    adduser -S -G telegraf telegraf && \
    apk add --no-cache ca-certificates curl tar && \
    curl -Lo telegraf.tar.gz https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_amd64.tar.gz && \
    echo "${TELEGRAF_MD5}  telegraf.tar.gz" | md5sum -c && \
    tar xfz telegraf.tar.gz --strip-components=2 && \
    apk del --purge curl tar && \
    rm -f telegraf.tar.gz

USER telegraf

VOLUME ["/etc/telegraf"]

CMD ["telegraf", "-config", "/etc/telegraf/telegraf.conf"]
