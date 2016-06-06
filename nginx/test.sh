#!/bin/bash

set -e

IMAGE=$(awk '/IMAGE\ \=/ {print $3}' Makefile)
VERSION=$(awk '/VERSION\ \=/ {print $3}' Makefile)
CONTAINER="nginx_$(date +"%N")"

for APP in curl docker; do
    if ! which $APP > /dev/null; then
       echo "$APP required to run the test."
       exit 1
    fi
done

docker run --disable-content-trust -d -P --name $CONTAINER $IMAGE:$VERSION 

HTTP_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' $CONTAINER)
HTTPS_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "443/tcp") 0).HostPort}}' $CONTAINER)

if [ ! "curl -sSf 127.0.0.1:$HTTP_PORT > /dev/null 2&>1" ] || [ ! "curl -sSf 127.0.0.1:$HTTPS_PORT > /dev/null 2&>1" ]; then
    echo "$IMAGE:$VERSION is not OK :(" 
    docker rm -f $CONTAINER
    exit 1
else
    echo "$IMAGE:$VERSION is OK :)" 
    docker rm -f $CONTAINER
    exit 0
fi
