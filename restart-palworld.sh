#!/bin/sh

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

. "${SCRIPT_DIR}/env.sh"

# サーバーに通知
${RCON_DIR}/rcon -a "localhost:25575" -p ${ADMIN_PASSWORD} "Broadcast The_server_will_restart_after_5_minutes."

# 5分待機
sleep 300

# サーバー再起動
systemctl ${SYSTEMCTL_PARAM} stop palworld.service
systemctl ${SYSTEMCTL_PARAM} start palworld.service
