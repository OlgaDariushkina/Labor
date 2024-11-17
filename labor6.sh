# кейс 1
cat hello.sh
#!/bin/bash
echo "Hello, Word!"

# кейс 2
cat greet.sh
#!/bin/bash
echo "Your name"
read name
echo "Hello, $name!"

# кейс 3
cat check_number.sh
#!/bin/bash
echo "Enter a number"
read n
if [ $n -eq 0 ]; then
    echo "$n is zero"
elif [ $n -lt 0 ]; then
    echo "$n is negative"
else
    echo "$n is positive"
fi

# кейс 4
cat countdown.sh
#!/bin/bash
i=$1
while [ $i -gt 0 ]; do
    echo $i
    i=$(($i - 1))
done

# кейс 5

cat file_manager.sh
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