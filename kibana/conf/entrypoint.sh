#!/bin/sh

set -e

if [ $ELASTICSEARCH ]; then
    sed -i s/localhost/$ELASTICSEARCH/g /kibana/config/kibana.yml
fi

exec "$@"
