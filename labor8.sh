# 1. Архивирование файлов и скачивание с сервера с последующим разархивированием
cat labor8skript1.sh
#!/bin/bash
read -p "Введите удалённый сервер (user@hostname): " REMOTE_HOST
read -p "Введите путь к удаленной папке : " REMOTE_DIR
read -p "Введите локальную директорию для сохранения архива: " LOCAL_SAVE_DIR
read -p "Введите название архива: " ARCHIVE_NAME
# Архивируем директорию на сервере
ssh "$REMOTE_HOST" "tar -czf /tmp/$ARCHIVE_NAME -C $(dirname "$REMOTE_DIR") $(basename "$REMOTE_DIR")"
# Скачиваем архив
scp "$REMOTE_HOST:/tmp/$ARCHIVE_NAME" "$LOCAL_SAVE_DIR"
# Разархивируем локально
tar -xzf "$LOCAL_SAVE_DIR/$ARCHIVE_NAME" -C "$LOCAL_SAVE_DIR"
# Удаляем архив на сервере
ssh "$REMOTE_HOST" "rm -f /tmp/$ARCHIVE_NAME"

# 2. Мониторинг свободного места на сервере
cat labor8skript2.sh
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

# 3. Синхронизация файлов между локальной машиной и удалённым сервером
cat labor8skript3.sh
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
