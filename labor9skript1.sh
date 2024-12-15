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
