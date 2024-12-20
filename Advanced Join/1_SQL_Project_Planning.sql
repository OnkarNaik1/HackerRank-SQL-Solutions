-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
-- It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day 
-- for each row in the table.
-- If the End_Date of the tasks are consecutive, then they are part of the same project. 
-- Samantha is interested in finding the total number of different projects completed.
-- Write a query to output the start and end dates of projects listed by the number of days 
-- it took to complete the project in ascending order. If there is more than one project 
-- that have the same number of completion days, then order by the start date of the project.
WITH st AS
(
SELECT start_date,
ROW_NUMBER() OVER (ORDER BY end_date) AS RN
FROM projects 
WHERE start_date NOT IN (SELECT end_date FROM projects)
),
ed AS
(
SELECT end_date,
ROW_NUMBER() OVER (ORDER BY start_date) AS RN
FROM projects 
WHERE end_date NOT IN (SELECT start_date FROM projects)
)
SELECT st.start_date,ed.end_date
FROM st
INNER JOIN ed
ON st.rn = ed.rn
ORDER BY DATEDIFF(ed.end_date, st.start_date), st.start_date;
