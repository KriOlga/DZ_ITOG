USE lesson_1;

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    title VARCHAR(50) NOT NULL,
    title_eng VARCHAR(50),
    year_movie YEAR NOT NULL,
    count_min INT,
    storyline TEXT
);


-- наполнение данными 
INSERT INTO movies (title, title_eng, year_movie, count_min, storyline)
VALUES 
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);


SELECT * FROM movies;


-- жанры
DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	name VARCHAR(100) NOT NULL
);

-- актеры
DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	firstname VARCHAR(100) NOT NULL ,
	lastname VARCHAR(100)
);


/*
1. Переименовать сущность movies в cinema.
2. Добавить сущности cinema новый атрибут status_active (тип BOOL) и атрибут genre_id после атрибута title_eng.
3. Удалить атрибут status_active сущности cinema. 
4. Удалить сущность actors из базы данных
5. Добавить внешний ключ на атрибут genre_id сущности cinema и направить его на атрибут id сущности genres.
6. Очистить сущность genres от данных.
*/

-- 1
RENAME TABLE movies TO cinema;

-- 2
ALTER TABLE cinema
ADD COLUMN status_active BOOL DEFAULT false;

SELECT * FROM cinema;

ALTER TABLE cinema
ADD COLUMN genre_id BIGINT UNSIGNED AFTER title_eng;

-- 3
ALTER TABLE cinema
DROP COLUMN status_active;

-- 4
DROP TABLE actors;

-- 5
ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id);

SHOW CREATE TABLE cinema;

-- 6
TRUNCATE TABLE genres;

ALTER TABLE cinema
DROP FOREIGN KEY cinema_ibfk_1;


ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE CASCADE;



CREATE TABLE studentMarks (stud_id INT NOT NULL AUTO_INCREMENT
PRIMARY KEY, total_marks INT, grade VARCHAR(5));

INSERT INTO studentMarks(total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');


/*
Задача 3. В зависимости от поля “grade”, установите еще один столбец с именем class в 
зависимости от значений: A++ – DISTINCTION,A+ – FIRST CLASS, A – SECOND CLASS,
 B+ – SECOND CLASS, C+ – THIRD CLASS, ALL OTHERS – FAIL
*/

SELECT * FROM studentMarks;

SELECT total_marks, grade,
CASE grade
	WHEN 'A++' THEN 'DISTINCTION'
    WHEN 'A+' THEN 'FIRST CLASS'
    WHEN 'A' THEN 'SECOND CLASS'
    WHEN 'B+' THEN 'SECOND CLASS'
    WHEN 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL'
END AS class
FROM studentMarks;

/*
Задача 4. Расставим студентам классы в зависимости от оценок.
Total_marks > 450 – «ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ»
Total_marks от 400 до 450 – «ПЕРВЫЙ КЛАСС»
Total_marks от 350 до 400 – «ВТОРОЙ КЛАСС»
Total_marks от 300 до 350 – «ТРЕТИЙ КЛАСС»
В противном случае - НЕУДАЧА

*/

SELECT total_marks, grade,
CASE 
	WHEN total_marks >= 450 THEN 'DISTINCTION'
    -- WHEN total_marks BETWEEN 400 AND 450 THEN 'FIRST CLASS'
    -- WHEN total_marks >= 400 AND  total_marks <= 450 THEN 'FIRST CLASS'
    WHEN total_marks >= 400 THEN 'FIRST CLASS'
    WHEN total_marks >= 350 THEN 'SECOND CLASS'
    WHEN total_marks >= 300 THEN 'THIRD CLASS'
    ELSE 'FAIL'
END AS class
FROM studentMarks;


/*


IF( condition, [value_if_true], [value_if_false] )
1. 	 Проверьте истинность выражения, используя оператор "IF"
Если 100<200, то печатаем 'yes'; иначе - 'no'

2.	В зависимости от общего количество баллов, укажите статус ученик в табеле успеваемости: если 
суммарное количество баллов больше 450, то студент закончил на “Отлично”; иначе - “Хорошо”
*/
-- 1
SELECT IF(1000 < 200, 'yes', IF(1000 < 2000, 'y', 'n'));




-- 2
SELECT total_marks, grade, IF(total_marks >= 450, 'Отлично', 'Хорошо')
AS class
FROM studentMarks;