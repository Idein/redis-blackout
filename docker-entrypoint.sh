#!/bin/sh

if [ "$1" = "redis-server" ]; then
    redis-server &
    toxiproxy-server &
    sleep 1
    toxiproxy-cli create redis -l "0.0.0.0:7379" -u "0.0.0.0:6379"
    sleep 30
    toxiproxy-cli toggle redis
    sleep 15
    toxiproxy-cli toggle redis
    while true; do
        sleep 1
    done
else
    exec "$@"
fi
