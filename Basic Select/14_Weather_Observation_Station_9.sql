-- Query the list of CITY names from STATION that do not start with vowels. 
-- Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city NOT REGEXP '^[aeiouAEIOU]';

-- OR 

SELECT DISTINCT city FROM station
WHERE city REGEXP '^[^aeiouAEIOU]';

-- OR

SELECT DISTINCT city FROM station
WHERE UPPER(SUBSTR(city,1,1)) NOT IN ('A','E','I','O','U');