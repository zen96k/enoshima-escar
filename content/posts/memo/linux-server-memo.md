+++
title = "Linux Server Memo"
date = "2024-07-12"
+++

自宅のPCにLinuxをインストールして、最初にやったことの備忘録。  
※ディストリビューションはDebian 12を使用した。

## タイムゾーン関連

下記コマンドを実行して、タイムゾーンを設定する。  
日付や時刻が日本時間のものに設定できていればOK。

```bash
$ sudo timedatectl set-timezone Asia/Tokyo
$ timedatectl
               Local time: Sat 2024-07-13 18:24:38 JST
           Universal time: Sat 2024-07-13 09:24:38 UTC
                 RTC time: Sat 2024-07-13 09:24:38
                Time zone: Asia/Tokyo (JST, +0900)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

### 参考URL

https://www.server-world.info/query?os=Ubuntu_22.04&p=timezone  
https://zenn.dev/kumamoto/articles/51bf0893620f0c

## SSH関連

※LinuxにSSHサーバーがインストールされていることが前提。  
[よく分かる公開鍵認証](https://knowledge.sakura.ad.jp/3543)を参考に、公開鍵/秘密鍵のペアを作成する。  
公開鍵を接続先の端末(Linux)に、秘密鍵を接続元の端末(Windowsなど)に配置して、SSHクライアントから接続する。  
接続できたら、公開鍵認証方式でのみ接続を許可するように、SSHサーバーの設定を変更する。  
具体的にはこんな感じ。

```
AllowUsers <user-name>
PasswordAuthentication no
PermitRootLogin no
Port <port-number>
UsePAM yes

Subsystem sftp /usr/lib/openssh/sftp-server
```

### 参考URL

https://knowledge.sakura.ad.jp/3543

## Docker関連

[Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian)を参考に、Dockerをインストールする。  
インストールできたら、[Run the Docker daemon as a non-root user (Rootless mode)](https://docs.docker.com/engine/security/rootless)を参考に、DockerをRootlessモードで動作するように設定する。

### 参考URL

https://docs.docker.com/engine/install/debian  
https://docs.docker.com/engine/security/rootless
