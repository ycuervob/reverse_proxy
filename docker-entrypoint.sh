#!/usr/bin/env sh
set -eu

envsubst '${API_HOST} ${API_PORT}' < /tmp/app.nginx > /etc/nginx/conf.d/default.conf

exec "$@"