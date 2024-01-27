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

# systemctlに登録
cat <<EOF > /etc/systemd/system/palworld.service
[Unit]
Description=palworld
After=network-online.target

[Service]
Type=simple
WorkingDirectory=${INSTALL_DIR}/
LimitNOFILE=100000
User=palworld

ExecStartPre=/usr/games/steamcmd +login anonymous +app_update 2394010 validate +quit
ExecStart=/bin/bash -c "./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS"
ExecStop=/bin/kill -s INT \$MAINPID

Restart=on-failure
RestartSec=30
TimeoutSec=600

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
sudo systemctl enable palworld.service
