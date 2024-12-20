-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

-- * 
-- * * 
-- * * * 
-- * * * * 
-- * * * * *
-- Write a query to print the pattern P(20).

DELIMITER //
CREATE PROCEDURE p(a INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 20
        DO
            SELECT REPEAT('* ', i) AS Pattern;
            SET i = i + 1;
    END WHILE;
END;
//
DELIMITER ;
CALL p(20);