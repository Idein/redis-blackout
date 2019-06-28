#!/bin/sh

if [ "$1" = "redis-server" ]; then
    redis-server &
    sleep 1
    vaurien --proxy "0.0.0.0:7379" --backend "0.0.0.0:6379" --protocol tcp --stay-connected --behavior 10:blackout --protocol-tcp-keep-alive &
    while true; do
        sleep 1
    done
else
    exec "$@"
fi
