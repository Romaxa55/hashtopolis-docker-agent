#!/bin/bash

# скачиваем файл hashtopolis.zip по ссылке и сохраняем его в /app
curl -L -o /app/hashtopolis.zip "$AGENT_URL"

# переходим в /app и распаковываем hashtopolis.zip
cd /app
unzip hashtopolis.zip

pip3 install setuptools
pip3 install requests
pip3 install psutil


#VOUCHER=$(head /dev/urandom | tr -dc A-Za-z | head -c $(($(od -An -N2 -i /dev/random) % 7 + 6)))
#echo $VOUCHER
#
## запускаем Hashtopolis агента
#python3 hashtopolis.zip
