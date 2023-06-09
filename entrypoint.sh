#!/bin/bash

# скачиваем файл hashtopolis.zip по ссылке и сохраняем его в /app
curl -L -o /app/hashtopolis.zip "${SERVER_URL}/agents.php?download=1"

# переходим в /app и распаковываем hashtopolis.zip
cd /app

echo $SERVER_URL
echo $TOKEN

VOUCHER=$(head /dev/urandom | tr -dc A-Za-z | head -c $(($(od -An -N2 -i /dev/random) % 7 + 6)))
echo $VOUCHER

curl -X POST -H "Content-Type: application/json" \
-d '{"section": "agent", "request": "createVoucher", "voucher": "'"$VOUCHER"'", "accessKey": "'"$TOKEN"'"}' \
"${SERVER_URL}/api/user.php"


# запускаем Hashtopolis агента
python3.8 hashtopolis.zip --url "${SERVER_URL}/api/server.php" --voucher "${VOUCHER}"
