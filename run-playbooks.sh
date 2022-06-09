#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

onExit() {
  cd "${ORIG_DIR}"
}
trap onExit EXIT

ansible-playbook ./playbooks/01-create-user.yaml -u root

ansible-playbook ./playbooks/02-update-os.yaml -l gitlab_runners

ansible-playbook ./playbooks/03-install-docker.yaml -l gitlab_runners
