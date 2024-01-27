#!/bin/bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

. "${SCRIPT_DIR}/env.sh"

mkdir -p "${UPDATE_DIR}"
mkdir -p "${BACKUP_DIR}"

# RCON INSTALL
mkdir -p "${RCON_DIR}"
cd "${RCON_DIR}"
curl -LO https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz
tar -xvzf rcon-0.10.3-amd64_linux.tar.gz --strip-components=1
rm -f rcon-0.10.3-amd64_linux.tar.gz
