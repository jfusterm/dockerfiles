FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV CONFLUENCE_VERSION=5.10.0 \
    MYSQL_CONNECTOR_VERSION=5.1.39

COPY response.varfile /

RUN set -ex && \
    apk add --no-cache gzip openjdk8-jre-base curl bash && \
    mkdir /atlassian && \
    curl -Lo confluence.bin https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin && \
    sh confluence.bin -q -varfile response.varfile && \
    curl -Lo mysql-connector.tar.gz http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.tar.gz && \
    tar -xzf mysql-connector.tar.gz && \
    cp mysql-connector-java-${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}-bin.jar /atlassian/confluence/confluence/WEB-INF/lib/ && \
    rm -fr mysql-* *.bin *.log *.varfile && \
    apk del --purge curl && \
    addgroup -S confluence && \
    adduser -S -G confluence confluence && \
    chown -R confluence:confluence /atlassian

USER confluence

VOLUME ["/atlassian"]

EXPOSE 8090

CMD ["/atlassian/confluence/bin/start-confluence.sh", "-fg"]
