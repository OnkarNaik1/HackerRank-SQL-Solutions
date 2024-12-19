-- Write a query to print all prime numbers less than or equal to 1000.
-- Print your result on a single line, and use the ampersand () character as your separator (instead of a space).
-- For example, the output for all prime numbers  would be:
-- 2&3&5&7
WITH RECURSIVE Numbers AS (
SELECT 2 AS n 
UNION
SELECT n + 1
FROM Numbers
WHERE n <= 1000
)

SELECT GROUP_CONCAT(n SEPARATOR '&') AS PrimeNumbers
FROM Numbers
WHERE NOT EXISTS (
SELECT 1
FROM Numbers AS N2
WHERE N2.n > 1 
AND N2.n < Numbers.n 
AND Numbers.n % N2.n = 0
) 
AND n <= 1000;