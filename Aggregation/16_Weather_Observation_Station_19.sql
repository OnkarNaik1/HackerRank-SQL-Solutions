-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective 
-- minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective 
-- minimum and maximum values of Western Longitude (LONG_W) in STATION.

-- Query the Euclidean Distance between points  and  and format your answer to display 4 decimal digits.

-- P1(a,c)
-- P2(b,d) 
-- a -> MIN(lat_n)
-- b -> MAX(lat_n)
-- c -> MIN(long_w)
-- d -> MAX(long_w)
SELECT 
ROUND(SQRT(
    POWER((MAX(lat_n) - MIN(lat_n)),2) 
  + POWER((MAX(long_w) - MIN(long_w)),2)),4)
FROM station;