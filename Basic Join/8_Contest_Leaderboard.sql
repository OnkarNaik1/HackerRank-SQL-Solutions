-- The total score of a hacker is the sum of their maximum scores for all of the challenges.
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
-- Exclude all hackers with a total score of 0 from your result.
SELECT h.hacker_id, h.name, SUM(s.max_score) AS total_score
FROM hackers h
INNER JOIN 
(
SELECT hacker_id, challenge_id, MAX(score) AS max_score
FROM submissions
GROUP BY 1,2
)s
ON h.hacker_id = s.hacker_id
GROUP BY 1,2
HAVING total_score != 0
ORDER BY total_score DESC, h.hacker_id;