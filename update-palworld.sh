#!/bin/sh

. ./env.sh

${RCON_DIR}/rcon -a "localhost:25575" -p ${ADMIN_PASSWORD} "Broadcast Checking_for_updates..."

echo "現在のバージョン確認中"
OLD_BUILD=`steamcmd +force_install_dir ${INSTALL_DIR} +login anonymous +app_status 2394010 +quit | grep -e "BuildID" | awk '{print $8}'`
echo "Old BuildID: ${OLD_BUILD}"

echo "アップデート中"
steamcmd +force_install_dir ${UPDATE_DIR} +login anonymous +app_update 2394010 validate +quit > /dev/null

echo "最新のバージョン確認中"
NEW_BUILD=`steamcmd +force_install_dir ${UPDATE_DIR} +login anonymous +app_status 2394010 +quit | grep -e "BuildID" | awk '{print $8}'`
echo "New BuildID: ${NEW_BUILD}"

# アップデート確認
if [ ${OLD_BUILD} = ${NEW_BUILD} ]; then
    echo "更新はありません"
    ${RCON_DIR}/rcon -a "localhost:25575" -p ${ADMIN_PASSWORD} "Broadcast Check_completed."
else
    echo "更新が見つかったため5分後に再起動します。"
    # サーバーに通知
    ${RCON_DIR}/rcon -a "localhost:25575" -p ${ADMIN_PASSWORD} "Broadcast Update_found.The_server_will_restart_after_5_minutes.Please_update_client."
    sleep 300
    # サーバー停止
    systemctl stop palworld.service
    # サーバーアップデート
    steamcmd +force_install_dir ${INSTALL_DIR} +login anonymous +app_update 2394010 validate +quit > /dev/null
    # サーバー起動
    systemctl start palworld.service
fi
