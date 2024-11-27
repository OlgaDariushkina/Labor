# кейс 6
cat sum.sh
#!/bin/bash
a=$1
b=$2
c=$(($a + $b))
echo $c

# кейс 7
cat read_file.sh
#!/bin/bash
# Определяем входной файл
INFILE=$1
# Читаем входной файл построчно
while read -r LINE
do
    printf '%s\n' "$LINE"
done < "$INFILE"

# кейс 8
cat  replace_text.sh
#!/bin/bash
file=$1
var1=$2
var2=$3
sed -i -e "s/$var1/$var2/g" $file

# кейс 9
cat baskup.sh
#!/bin/bash
echo "Укажите директорию в которой нахолятся файлы для копирования"
read dir1
echo "Укажите директорию куда копировать файлы"
read dir2
cp -a $dir1. $dir2"$dir2-$(date +"%m-%d-%y")"

# кейс 10
cat math_operations.sh
#!/bin/bash
math_operations(){
echo "Укажите первое число"
read a
echo "Укажите второе число"
read b
echo "Укажите операцию(сложение, вычитание, умножение, деление)"
read oper
if [ $oper == 'сложение' ]; then
    res = (( $a + $b ))
    echo $res
elif [ $oper == 'вычитание' ]; then
    res = (( $a - $b ))
    echo $res
elif [ $oper == 'умножение' ]; then
    res = (( $a * $b ))
    echo $res
elif [ $oper == 'деление' ]; then
    res = (( $a / $b ))
    echo $res
fi
}