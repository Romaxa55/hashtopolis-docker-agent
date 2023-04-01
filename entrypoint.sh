#!/bin/bash

SERVER_URL="http://51.161.212.110:8080"

# скачиваем файл hashtopolis.zip по ссылке и сохраняем его в /app
curl -L -o /app/hashtopolis.zip "$AGENT_URL"

# переходим в /app и распаковываем hashtopolis.zip
cd /app

bash
VOUCHER=$(head /dev/urandom | tr -dc A-Za-z | head -c $(($(od -An -N2 -i /dev/random) % 7 + 6)))


curl -X POST -H "Content-Type: application/json" \
-d '{"section": "agent", "request": "createVoucher", "voucher": "'"$VOUCHER"'", "accessKey": "'"$TOKEN"'"}' \
"${SERVER_URL}/api/user.php"
SERV="${SERVER_URL}/api/server.php"

# запускаем Hashtopolis агента
python3.8 hashtopolis.zip --url http://51.161.212.110:8080/api/server.php --voucher $VOUCHER
