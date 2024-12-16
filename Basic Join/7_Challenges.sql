-- Julia asked her students to create some coding challenges. 
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. 
-- If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than 
-- the maximum number of challenges created, then exclude those students from the result.
WITH ChallengeCounts AS (
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenges_created
FROM hackers h
INNER JOIN challenges c
ON h.hacker_id = c.hacker_id
GROUP BY 1,2
),
MaxChallenges AS (
SELECT MAX(challenges_created) AS max_challenges
FROM ChallengeCounts
),
UniqueCounts AS (
SELECT challenges_created 
FROM ChallengeCounts
GROUP BY challenges_created
HAVING COUNT(*) = 1
)
SELECT 
cc.hacker_id, cc.name, cc.challenges_created
FROM ChallengeCounts cc
WHERE cc.challenges_created = (SELECT max_challenges FROM MaxChallenges)
OR cc.challenges_created IN (SELECT challenges_created FROM UniqueCounts)
ORDER BY cc.challenges_created DESC, cc.hacker_id;