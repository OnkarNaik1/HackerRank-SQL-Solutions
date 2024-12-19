-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *
-- Write a query to print the pattern P(20).
DELIMITER //
CREATE PROCEDURE pattern(a INT)
BEGIN
    WHILE a >= 1 DO
        SELECT REPEAT('* ', a) AS Pattern;
        SET a = a - 1;
    END WHILE;
END;
//
DELIMITER ;


CALL PATTERN(20);