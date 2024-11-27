  GNU nano 8.2                                                                                    math_operations.sh                                                                                    Modified
#!/bin/bash
math_operations(){
echo "Укажите первое число"
read a
echo "Укажите второе число"
read b
echo "Укажите операцию(сложение, вычитание, умножение, деление)"
read oper
if [ $oper == 'сложение' ]; then
    res = (( a + b ))
    echo $res
elif [ $oper == 'вычитание' ]; then
    res = (( a - b ))
    echo $res
elif [ $oper == 'умножение' ]; then
    res = (( a * b ))
    echo $res
elif [ $oper == 'деление' ]; then
    res = (( a / b ))
    echo $res
fi
}

