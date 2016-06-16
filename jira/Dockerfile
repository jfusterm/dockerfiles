FROM jfusterm/alpine-glibc:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV JIRA_VERSION=7.1.7 \
    MYSQL_CONNECTOR_VERSION=5.1.39

COPY response.varfile /

RUN set -ex && \
    apk add --no-cache gzip openjdk8-jre-base curl bash && \
    mkdir /atlassian && \
    curl -Lo jira.bin https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-${JIRA_VERSION}-jira-${JIRA_VERSION}-x64.bin && \
    sh jira.bin -q -varfile response.varfile && \
    curl -Lo mysql-connector.tar.gz http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.tar.gz && \
    tar -xzf mysql-connector.tar.gz && \
    cp mysql-connector-java-${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}-bin.jar /atlassian/jira/lib/ && \
    rm -fr mysql-* *.bin *.log *.varfile && \
    apk del --purge curl && \
    addgroup -S jira && \
    adduser -S -G jira jira && \
    chown -R jira:jira /atlassian

USER jira

VOLUME ["/atlassian"]

EXPOSE 8080

CMD ["/atlassian/jira/bin/start-jira.sh", "-fg"]
