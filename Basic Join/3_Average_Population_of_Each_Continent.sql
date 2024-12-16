-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT country.continent,FLOOR(AVG(city.population))
FROM country
INNER JOIN city
ON country.code = city.countrycode
GROUP BY 1;