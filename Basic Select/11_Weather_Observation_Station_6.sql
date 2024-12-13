-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city REGEXP '^[aeiouAEIOU]';

-- OR

SELECT DISTINCT city FROM station
WHERE UPPER(SUBSTR(city,1,1)) IN ('A','E','I','O','U');