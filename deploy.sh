#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  cd "${ORIG_DIR}"
}
trap onExit EXIT

export GITLAB_HOME="$(pwd)/data"

if [ "$1" = "down" ]; then
  echo "Shutting down..."
  docker-compose down
elif [ "$1" = "restart" ]; then
  echo "Restarting..."
  docker-compose pull
  docker-compose restart
else
  echo "Running..."
  mkdir -p "${GITLAB_HOME}"
  docker-compose pull
  docker-compose up -d
fi
