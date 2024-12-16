-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons 
-- needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, 
-- and power of the wands that Ron's interested in, sorted in order of descending power.
-- If more than one wand has same power, sort the result in order of descending age.
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w
INNER JOIN wands_property wp
ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM wands w1
    INNER JOIN wands_property wp1
    ON w1.code = wp1.code
    WHERE wp1.is_evil = 0
    AND w1.power = w.power
    AND wp1.age = wp.age
)
ORDER BY w.power DESC, wp.age DESC;