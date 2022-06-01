#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  cd "${ORIG_DIR}"
}
trap onExit EXIT

main() {
  installDocker
}

installDocker() {
  curl -fsSL https://get.docker.com | sh -s
}

main "$@"
