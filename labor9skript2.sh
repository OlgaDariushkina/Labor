#!/bin/bash
read -p "Введите удалённый сервер (user@hostname): " REMOTE_HOST
read -p "Введите порог использования диска (в процентах): " THRESHOLD
read -p "Введите email для уведомлений: " EMAIL
# Проверяем использование дискового пространства на удалённом сервере
USAGE=$(ssh "$REMOTE_HOST" "df --output=pcent / | tail -1 | tr -dc '0-9'")
# Проверяем, превышает ли использование диска порог
if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "Использование диска на сервере $REMOTE_HOST достигло $USAGE%, что превышает порог $THRESHOLD%." \
    | mail -s "Уведомление: высокая загрузка диска" "$EMAIL"
  echo "Уведомление отправлено на $EMAIL."
else
  echo "Использование диска на сервере $REMOTE_HOST: $USAGE%. Порог $THRESHOLD% не превышен."
fi
