-- Samantha interviews many candidates from different colleges using coding challenges and contests. 
-- Write a query to print the contest_id, hacker_id, name, and 
-- the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views 
-- for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.
-- Note: A specific contest can be used to screen candidates at more than one college, 
-- but each college only holds 1 screening contest.
SELECT 
    SS.contest_id, 
    SS.hacker_id, 
    SS.name, 
    SS.S1, 
    SS.S2, 
    VS.S3, 
    VS.S4
FROM (
SELECT
    c.contest_id, 
    c.hacker_id, 
    c.name,
    SUM(s.total_submissions) AS S1,
    SUM(s.total_accepted_submissions) AS S2
FROM contests c
INNER JOIN Colleges cl ON c.contest_id = cl.contest_id
INNER JOIN Challenges ch ON cl.college_id = ch.college_id
INNER JOIN submission_stats s ON s.challenge_id = ch.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
) SS
INNER JOIN (
SELECT
    c.contest_id, 
    c.hacker_id, 
    c.name,
    SUM(vs.total_views) AS S3, 
    SUM(vs.total_unique_views) AS S4
FROM contests c
INNER JOIN Colleges cl ON c.contest_id = cl.contest_id
INNER JOIN Challenges ch ON cl.college_id = ch.college_id
INNER JOIN view_stats vs ON ch.challenge_id = vs.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
) VS ON SS.contest_id = VS.contest_id 
   AND SS.hacker_id = VS.hacker_id 
   AND SS.name = VS.name
WHERE SS.S1 > 0 OR SS.S2 > 0 OR VS.S3 > 0 OR VS.S4 > 0
ORDER BY SS.contest_id;

