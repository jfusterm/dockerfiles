#!/bin/sh

set -e

if [ $ELASTICSEARCH ]; then
    sed -i s/localhost/$ELASTICSEARCH/g /logstash/logstash.conf
fi

exec "$@"
