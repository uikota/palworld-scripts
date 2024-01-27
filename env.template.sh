#!/bin/bash

# スクリプト自身のフルパスを取得
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# SCRIPT_DIRから一つ上のディレクトリを取得
export HOME_DIR=$(dirname "$SCRIPT_DIR")

export RCON_DIR="${HOME_DIR}/rcon"
export INSTALL_DIR="${HOME_DIR}/.steam/SteamApps/common/PalServer"
export UPDATE_DIR="${HOME_DIR}/update/PalServer"
export BACKUP_DIR="${HOME_DIR}/backup"
export ADMIN_PASSWORD="ここにパスワード"

echo ${HOME_DIR}
