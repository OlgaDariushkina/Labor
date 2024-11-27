#!/bin/bash

# Определяем входной файл
INFILE=$1

# Читаем входной файл построчно
while read -r LINE
do
    printf '%s\n' "$LINE"
done < "$INFILE"
