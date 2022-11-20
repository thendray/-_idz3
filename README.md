# Отчет по индивидуальному домашнему заданию №3

Вариант - 16

---

**Ориентируемся на 8 баллов**

Тогда наш код на Си/ассемблер должен содержать

+ Функция с передаваемыми аргументами
+ Локальные переменные
+ 2 единицы компиляции
+ Возможность ввода через файлы
+ Программный выбор ввода: случайно/с файла/с клавиатуры
+ Генерация случайных значений
+ замер времени
+ сравнение по размеру программ


---

![image](https://user-images.githubusercontent.com/96993075/202899201-39f70f6c-e0ac-4460-8aa9-6d9f1f610ff6.png)

Хочу отметить, что для корректной работы программы (соблюдение точности не менее 0.05%) рекомендуется использоввать диапозон вводиомго значения от [-110, 16]

---

Код программы на Си - [часть1](/с/part1.c)

Код программы на Си - [часть2](/с/part2.c)

---

Далее создадим файл на ассемблере с помощью команд

     $ gcc -masm=intel part1.c -S -o part1.s
     $ gcc -masm=intel part2.c -S -o part2.s

Получившиеся скомпилируем и запустим

    $ gcc part1.s -c -o part1.o
    $ gcc part2.s -c -o part2.o
    $ gcc ./part2.o part1.o -o foo1 -lm
    
-lm для компидяции с math.h 

[part1.s](/asm/part1.s)

[part2.s](/asm/part2.s)

В полученные файлы добавлены комментарии о переменных.

---

Используя соответсвующие флаги получим файлы без лишних макросов

     $ gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./part1.c -S -o ./part1_cl.s
     $ gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./part2.c -S -o ./part2_cl.s


[part1_cl.s](/asm/part1_cl.s)

[part2_cl.s](/asm/part2_cl.s)

В полученные файлы добавлены все необходимые комментарии.

---

Далее получим файлы с использованием регистров вместо стека

[Фай1_регсистр](/asm/part1_cl_reg.s)

[Файл2_регистр](/asm/part2_cl_reg.s)

В полученные файлы добавим комментарии об использовании регистров вместо стека

---

**Сравним размеры трех программ**

(представленные значения взяты до комментирования)

**Программа на Си** - 1874 байт + 119 байт

**Программа на ассемблере со стеком** - 6390 байт + 895 байт

**Программа на ассемблере с регистрами** - 4412 байт + 422 байт

---

## Тестирование

**Инструкция по вводу и выводу**

     $ ./<исполняемый файл> <InputType> <InputFilePath>(опционально) <OutputFilePath>(опционально)


1. InputType - вводите "c", если хоите ввсети данные из консоли. Вводите "r" - если хотите получить рандомное значение. Вводите "f", если хотите прочитать данные из файла

2. Если данные ввыодятся из файла, укажите далее пути к файллу для чтения и записи

          $ ./foo f test1.in output.txt
     

Вывод состоит из 3х строк: 

**Programm working time** - время выполнения программы (стоит отметить, что основная часть зациклена 1000 раз)

**Programm result** - результат, посчитанный программой с помощью суммы членов ряда. 

**Precision** - точность в процентах - отличние полученного значения от эталонного из math


**Сравним на двух тестах время работы трех программ**

[Тест1](/test/test1.in)

**Си** - 0.86753 сек

**Ас. стек** - 0.832 сек

**Ас. регистры** - 0.75 сек


[Тест2](/tets/test2.in)

**Си** - 0.77732 сек

**Ас. стек** - 0.8195 сек

**Ас. регистры** - 0.58001 сек

Можно сделать однозначный вывод, что программа на ассемблере с использованием регистров работает быстрее других

---

Далее представлено описание остальных тестов.

1-3 Тесты на некорректный ввод в командной строке

4-10 Тесты на функциональную работу программы

[Тесты](/test/)

*Результаты*

![изображение](https://user-images.githubusercontent.com/96993075/202914608-f822f73b-7588-44e8-8713-de9d4fa856c2.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914762-0e8dd723-b6e3-48f8-a688-91e539b7ba0e.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914787-fe32a8a8-859d-4f77-b29c-948f816823cd.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914818-3b669583-e62c-49e1-a470-4ba2abe72339.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914924-2744cbb6-7f23-43f2-909a-0df77df12998.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914952-6a48978f-c484-489f-95bb-2a1698136ef6.png)

![изображение](https://user-images.githubusercontent.com/96993075/202914990-c4791479-ce57-42ab-95f9-a20e9af4cf74.png)

