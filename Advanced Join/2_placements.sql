-- You are given three tables: Students, Friends and Packages. 
-- Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. 
-- It is guaranteed that no two students got same salary offer.
WITH my_sal AS(
SELECT s.id,s.name,p.salary
FROM Students s 
LEFT OUTER JOIN Friends f 
ON s.id = f.id
LEFT OUTER JOIN Packages P
ON s.id = p.id
),
friend_sal AS(
SELECT s.id,f.friend_id,s.name,p.salary
FROM Students s 
LEFT OUTER JOIN Friends f 
ON s.id = f.id
LEFT OUTER JOIN Packages P
ON f.friend_id = p.id
)
SELECT my_sal.name
FROM my_sal
INNER JOIN friend_sal
ON my_sal.id = friend_sal.id
WHERE my_sal.salary < friend_sal.salary
ORDER BY friend_sal.salary;