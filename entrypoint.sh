#!/bin/bash

# скачиваем файл hashtopolis.zip по ссылке и сохраняем его в /app
curl -L -o /app/hashtopolis.zip "$AGENT_URL"

# переходим в /app и распаковываем hashtopolis.zip
cd /app

bash
#VOUCHER=$(head /dev/urandom | tr -dc A-Za-z | head -c $(($(od -An -N2 -i /dev/random) % 7 + 6)))
#echo $VOUCHER
#
## запускаем Hashtopolis агента
#python3 hashtopolis.zip
