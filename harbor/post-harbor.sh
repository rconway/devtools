#!/usr/bin/env bash
#
# Place this file in directory: /etc/letsencrypt/renewal-hooks/post/

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  cd "${ORIG_DIR}"
}
trap onExit EXIT

cp -f /etc/letsencrypt/live/harbor.rconway.uk/fullchain.pem /data/secret/cert/server.crt
cp -f /etc/letsencrypt/live/harbor.rconway.uk/privkey.pem /data/secret/cert/server.key
/usr/bin/docker start nginx
