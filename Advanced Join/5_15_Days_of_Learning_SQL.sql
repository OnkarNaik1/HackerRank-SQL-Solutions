-- Julia conducted a 15 days of learning SQL contest. 
-- The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
-- Write a query to print total number of unique hackers who made at least 1 submission 
-- each day (starting on the first day of the contest), and find the hacker_id and name of the hacker 
-- who made maximum number of submissions each day. If more than one such hacker 
-- has a maximum number of submissions, print the lowest hacker_id. The query should print 
-- this information for each day of the contest, sorted by the date.
SELECT submission_date,  -- first column: submission date
( 
SELECT COUNT(DISTINCT hacker_id)  
FROM submissions S2  
WHERE S2.submission_date = S1.submission_date 
AND(
SELECT COUNT(DISTINCT S3.submission_date) 
FROM submissions S3 
WHERE S3.hacker_id = S2.hacker_id 
AND S3.submission_date < S1.submission_date) = DATEDIFF(S1.submission_date , '2016-03-01')
), -- second column: count of max submissions
(
SELECT hacker_id 
FROM submissions S2 
WHERE S2.submission_date = S1.submission_date 
GROUP BY hacker_id 
ORDER BY COUNT(submission_id) DESC, hacker_id LIMIT 1) AS TMP, -- thrid column: hacker_id
(SELECT NAME 
FROM hackers 
WHERE hacker_id = TMP) -- fourth column: name
FROM
(SELECT DISTINCT submission_date 
FROM submissions) S1
GROUP BY submission_date;