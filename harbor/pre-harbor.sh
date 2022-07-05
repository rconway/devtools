#!/usr/bin/env bash
#
# Place this file in directory: /etc/letsencrypt/renewal-hooks/pre/

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  cd "${ORIG_DIR}"
}
trap onExit EXIT

/usr/bin/docker stop nginx
