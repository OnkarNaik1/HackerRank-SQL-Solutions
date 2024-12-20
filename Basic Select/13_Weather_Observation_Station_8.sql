-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
-- Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city REGEXP '^[aeiouAEIOU]'
AND city REGEXP '[aeiouAEIOU]$';

-- OR

SELECT DISTINCT city FROM station
WHERE UPPER(SUBSTR(city,1,1)) IN ('A','E','I','O','U')
AND  UPPER(SUBSTR(city,-1,1)) IN ('A','E','I','O','U');