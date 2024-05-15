-- commit
# commit
/*
commit
commit
*/

USE lesson_1;
/*
1. Получить список с информацией обо всех студентах

2. Получить список всех студентов с именем “Tom”(или любого существующего студента)

3. Вывести имя и название курса из таблички "Студент"

4*. Выбрать студентов, имена которых начинаются с буквы «M».
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
-- % это несколько или ноль симоволов
-- _ нижнее поддчеркивание это сторого 1 символ после

SELECT * FROM student
WHERE name LIKE 'm%';

SELECT * FROM student
WHERE name LIKE 'm%r%';

SELECT * FROM student
WHERE name LIKE 'm%r_%';

/*
1. Выбрать всех студентов,у которых стипендия больше 6000

2. Покажите всех студентов, которые принадлежат к курсу IT.

3. Отобразите всех студентов, который НЕ принадлежат к курсу IT
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
