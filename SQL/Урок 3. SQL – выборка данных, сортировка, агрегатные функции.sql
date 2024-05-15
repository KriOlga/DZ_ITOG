SELECT * FROM lesson_3.staff;
-- 1.	Выведите все записи, отсортированные по полю "age" по возрастанию

select * from staff
order by age;
-- 2.	Выведите все записи, отсортированные по полю
--  " firstname "
select  * from staff
order by firstname;
-- 3.	Выведите записи полей " firstname ", "lastname","age",
-- отсортированные по полю " firstname " в алфавитном порядке по убыванию
select firstname, lastname, age from staff
order by firstname desc;
-- 4.	Выполните сортировку по полям " firstname " и "age" по убыванию
select * from staff
order by age desc, firstname;


-- 1. Выведите уникальные (неповторяющиеся) значения полей "firstname"
SELECT distinct firstname from staff;
-- если задать несколько параметров то выведет все 
-- уникальные по всем параметрам
SELECT distinct firstname, age from staff
order by firstname;

-- 2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки
select * from staff
order by id
limit 2;

-- самый старший человек
select * from staff
order by age desc
limit 1;
-- 3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
select * from staff
order by id desc
limit 2, 3;
-- 4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки


INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Петр', 'Власов', 'Начальник', '8', 70000, 30);

-- Работа персонала
DROP TABLE IF EXISTS employee_tbl;
CREATE TABLE employee_tbl (
	id_emp INT AUTO_INCREMENT PRIMARY KEY,
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	work_date DATE,
	daily_typing_pages INT
);
select * from employee_tbl;
-- 1.	Рассчитайте общее количество всех страниц daily_typing_pages
select sum(daily_typing_pages) from employee_tbl;

-- 2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  
-- select name, sum(daily_typing_page) as sum, count work_date as count
-- from employee_tbl
-- group by name;
-- 3.	Посчитайте количество записей в таблице
select count(*) from employee_tbl;
-- 4.	Выведите количество имен, которые являются уникальными 
select count(distinct name)  from employee_tbl;
-- 5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
select avg(daily_typing_pages) from employee_tbl;

CREATE TABLE employee_salary (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INT,
	salary INT
);

-- Наполнение данными
INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы  найдите суммарную зарплату 
select * from employee_salary;
select age, sum(salary)
from employee_salary
group by age;

-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
select age, max(salary)
from employee_salary
group by age;

-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы
select age, min(salary)
from employee_salary
group by age;


-- Задания:
-- 1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000
select age, sum(salary) as summ
from employee_salary
group by age
having summ > 1000;

-- 2. 	Выведите только те группы, в которых количество строк меньше или равно двум
select age, count(*) count
from employee_salary
group by age
having count <=2;

-- 3.	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”
select age, count(*) count
from employee_salary
group by age
having count between 0 and 2;

-- 4.*	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”
select age, count(*) count
from employee_salary
group by age
having count in (0,1,2);
