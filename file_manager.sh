#!/bin/bash
dir_name=$1
mkdir -p "$dir_name"
echo "Создали директорию $dir_name"
cd "$dir_name"
echo "Перешли в директорию $dir_name"
touch file1.txt file2.txt
echo "Создали файлы file1.txt file2.txt"
rm file1.txt file2.txt
echo "Удалили файлы file1.txt file2.txt"
cd ..
echo "Вернулись в родительскую директорию"
