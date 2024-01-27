# palworld-scripts
身内用のパルワールドサーバースクリプト

## How to use

### ホームディレクトリ上で当リポジトリをクローン
```bash
cd /home/palworld
git clone git@github.com:uikota/palworld-scripts.git
cd ./palworld-scripts
```

### 環境設定をコピーして編集
```bash
cp ./env.template.sh ./env.sh
```
`ADMIN_PASSWORD`にパルワールドのAdminPasswordを入れてください

### AWS EC2で立ち上げる場合
`setup.sh`で`/etc/systemd/system/palworld.service`を作成していますが、
` ~/.config/systemd/user/palworld.service`に配置する必要があります。

中身は`User=palworld`を削除、`WantedBy`を`WantedBy=default.target`に変更する必要があります。

コマンドは全て`systemctl --user start palworld.service`というように`--user`を指定してあげる必要があります。
