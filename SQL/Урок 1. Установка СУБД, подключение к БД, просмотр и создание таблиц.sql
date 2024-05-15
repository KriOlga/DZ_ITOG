-- comment
# comment
/*
comment
comment
*/

USE lesson_1;
/*
1.	Получить список с информацией обо всех студентах

2. 	Получить список всех студентов с именем “Tom”(или любого существующего студента)

3. 	Вывести имя и телефон из таблички "Студент"

4*.	Выбрать студентов, имена которых начинаются с буквы «M».
*/

-- 1
SELECT * FROM student;

-- 3
SELECT name, phone FROM student;

-- 2
SELECT * FROM student
WHERE name = 'Tom';

-- 4
-- LIKE
-- Galaxy S8, Galaxy S10, Galaxy S10s, Galaxy A5
-- % - несколько или ноль символов. LIKE 'Galaxy S%' -> Galaxy S8, Galaxy S10, Galaxy S10s
-- _ - один символ. LIKE 'Galaxy S_' -> Galaxy S8

SELECT * FROM student
WHERE name LIKE 'M%';

SELECT * FROM student
WHERE name LIKE 'M%r__%';


/*
1.	Выбрать всех студентов,у которых стипендия  больше 6000

2.	Покажите всех студентов, которые принадлежат к курсу IT.

3. Отобразите  всех студентов, который НЕ принадлежат к курсу IT
*/

-- 1
SELECT * FROM student
WHERE stip >= 6000;

-- 2
SELECT * FROM student
WHERE course_name = 'IT';

-- 3
SELECT * FROM student
WHERE course_name != 'IT';