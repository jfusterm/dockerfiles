FROM alpine:3.4
MAINTAINER "Joan Fuster" <joan.fuster@gmail.com>

ENV JENKINS_VERSION=2.9

RUN set -ex && \
    addgroup -S jenkins && \
    adduser -S -G jenkins jenkins && \
    apk add --no-cache openjdk8-jre openssl ttf-dejavu && \
    mkdir -p /jenkins/plugins && \
    wget -O /jenkins/jenkins.war http://mirrors.jenkins-ci.org/war/${JENKINS_VERSION}/jenkins.war && \
    chown -R jenkins:jenkins /jenkins

USER jenkins

EXPOSE 8080 50000

VOLUME ["/jenkins"]

ENTRYPOINT ["java", "-jar", "/jenkins/jenkins.war"]
