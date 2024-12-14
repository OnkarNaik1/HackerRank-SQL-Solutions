-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
--and displayed underneath its corresponding Occupation. 
--The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.

-- Sample Output
-- Jenny    Ashley     Meera  Jane
-- Samantha Christeen  Priya  Julia
-- NULL     Ketty      NULL   Maria

SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM 
(
SELECT name, occupation, 
ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS rownum
FROM occupations
)sub
GROUP BY rownum
ORDER BY rownum;