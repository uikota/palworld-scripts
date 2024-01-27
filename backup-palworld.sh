#!/bin/bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

. "${SCRIPT_DIR}/env.sh"

# バックアップ対象のディレクトリ
SOURCE_DIR="${INSTALL_DIR}/Pal/Saved/SaveGames"

# 現在の日付と時間を取得 (YYYYMMDDHHMM 形式)
DATETIME=$(date +%Y%m%d%H%M)

# バックアップファイル名 (例: backup_202401241530.tar.gz)
BACKUP_FILE="backup_$DATETIME.tar.gz"

# バックアップの実行
(cd $SOURCE_DIR && tar -czf "$BACKUP_DIR/$BACKUP_FILE" .)

echo "Backup completed: $BACKUP_FILE"
${RCON_DIR}/rcon -a "localhost:25575" -p ${ADMIN_PASSWORD} "Broadcast Backup_completed:$BACKUP_FILE"
