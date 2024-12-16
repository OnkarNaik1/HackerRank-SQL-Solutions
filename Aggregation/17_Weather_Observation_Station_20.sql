-- A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal 4 places.
WITH CTE AS (
    SELECT lat_n,
           ROW_NUMBER() OVER (ORDER BY lat_n) AS rn,
           COUNT(*) OVER () AS cnt
    FROM station
)
SELECT 
CASE 
    WHEN CTE.cnt % 2 = 1 
    THEN ROUND((SELECT lat_n FROM CTE WHERE rn = (CTE.cnt + 1) / 2),4)
    ELSE ROUND((SELECT AVG(lat_n) 
                FROM CTE WHERE rn IN (CTE.cnt / 2, (CTE.cnt / 2) + 1)),4)
END AS result
FROM CTE
LIMIT 1;
