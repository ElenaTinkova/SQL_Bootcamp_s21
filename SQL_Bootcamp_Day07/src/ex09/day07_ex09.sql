-- returns aggregated information by person's address,
-- the result of "Maximum Age - (Minimum Age / Maximum Age)" presented as a formula column,
-- next is average age per address and the result of comparison between formula
-- and average columns (in other words, if formula is greater than average, then True, otherwise False value).
-- The result should be sorted by address column.

SELECT address,
       ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
       CASE
           WHEN ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)) , 2) > ROUND(AVG(age), 2)
           THEN true
           ELSE false
       END AS comparison
FROM person
GROUP BY address
ORDER BY address;