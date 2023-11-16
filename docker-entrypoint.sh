#!/bin/sh
set -e

exec /usr/sbin/sshd -D

set -- matter-server --storage-path /data "$@"

echo "Starting server:" "$@"
exec "$@"

