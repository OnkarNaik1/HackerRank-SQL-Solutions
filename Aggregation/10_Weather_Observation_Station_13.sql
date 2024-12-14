-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . 
-- Truncate your answer to  decimal places.
SELECT ROUND(SUM(lat_n),4) FROM station
WHERE lat_n > 38.7880
AND lat_n < 137.2345;