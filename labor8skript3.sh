#!/bin/bash
read -p "Введите локальную директорию: " LOCAL_DIR
read -p "Введите удалённый сервер (user@hostname): " REMOTE_HOST
read -p "Введите удалённую директорию: " REMOTE_DIR
read -p "Введите список игнорируемых файлов/директорий через запятую: " IGNORED
# Создаём временный файл с правилами игнорирования
IGNORE_FILE=$(mktemp)
IFS=',' read -ra IGNORE_LIST <<< "$IGNORED"
for item in "${IGNORE_LIST[@]}"; do
  echo "$item" >> "$IGNORE_FILE"
done
# Выполняем синхронизацию с использованием rsync
rsync -avz --progress --exclude-from="$IGNORE_FILE" -e ssh "$LOCAL_DIR/" "$REMOTE_HOST:$REMOTE_DIR"
# Удаляем временный файл с правилами игнорирования
rm -f "$IGNORE_FILE"
echo "Синхронизация завершена!"
