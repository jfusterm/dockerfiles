FROM jfusterm/alpine-glibc:3.3
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV TELEGRAF_VERSION=0.12.0 \
    TELEGRAF_MD5=e44b7c959d168ef03f4e8f2854384a77

RUN addgroup -S telegraf && adduser -S -G telegraf telegraf && \
    apk add --no-cache ca-certificates && \
    wget -O telegraf.tar.gz http://get.influxdb.org/telegraf/telegraf-${TELEGRAF_VERSION}-1_linux_amd64.tar.gz && \
    echo "${TELEGRAF_MD5}  telegraf.tar.gz" | md5sum -c && \
    tar xvfz telegraf.tar.gz && \
    rm -f telegraf.tar.gz

USER telegraf

VOLUME ["/etc/telegraf"]

CMD ["telegraf", "-config", "/etc/telegraf/telegraf.conf"]
