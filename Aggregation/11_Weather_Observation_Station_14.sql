-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
-- Truncate your answer to 4 decimal places.
SELECT ROUND(MAX(lat_n),4) AS mxlatn
FROM station
WHERE lat_n < 137.2345;