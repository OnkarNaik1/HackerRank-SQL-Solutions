-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
-- Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city NOT REGEXP '^[aeiouAEIOU]'
OR city NOT REGEXP '[aeiouAEIOU]$';

--OR

SELECT DISTINCT city FROM station
WHERE city REGEXP '^[^aeiouAEIOU]'
OR city REGEXP '[^aeiouAEIOU]$';


--OR

SELECT DISTINCT city FROM station
WHERE UPPER(SUBSTR(city,1,1)) NOT IN ('A','E','I','O','U')
OR UPPER(SUBSTR(city,-1,1)) NOT IN ('A','E','I','O','U');