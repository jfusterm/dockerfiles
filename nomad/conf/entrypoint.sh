#!/bin/sh

IP=$(ifconfig | awk '/inet addr/{print substr($2,6)}' | grep -v '127.0.0.1')

sed -i "s/IP/$IP/g" /nomad/etc/server.hcl

exec "$@"
