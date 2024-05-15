/* 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER $$
DROP FUNCTION IF EXISTS time_translation;
CREATE FUNCTION time_translation(n INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE d INT DEFAULT 0;
    DECLARE h INT DEFAULT 0;
    DECLARE m INT DEFAULT 0;
    DECLARE s INT DEFAULT 0;
  DECLARE res VARCHAR(250) DEFAULT '';
    
    SET d = n DIV (24 * 3600);
    SET n = n MOD (24 * 3600);
    SET h = n DIV 3600;
    SET n = n MOD 3600;
    SET m = n DIV 60;
    SET s = n MOD 60;
    
    SET res = CONCAT(d, ' days ', h, ' hours ', m, ' minutes ', s, ' seconds');

RETURN res;
END $$
DELIMITER ;

SELECT time_translation(123456);

/*2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS even_numbers;
CREATE PROCEDURE even_numbers(n INT)
BEGIN
  DECLARE m INT DEFAULT 1;
  DECLARE res VARCHAR(250) DEFAULT '';

  WHILE m <= n DO
    IF (m % 2) = 0 THEN
      IF m < n THEN
        SET res = CONCAT(res,' ', m, ', ');
      ELSE SET res = CONCAT(res,' ', m);
            END IF;
    END IF;
        SET m = m + 1;
    END WHILE;
    SELECT res;

END $$
DELIMITER ;

CALL even_numbers(10);
