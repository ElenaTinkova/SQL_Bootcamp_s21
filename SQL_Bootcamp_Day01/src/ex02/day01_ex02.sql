-- returns unique pizza names from the menu table
-- and orders them by pizza_name column in descending mode.
-- Denied section: DISTINCT, GROUP BY, HAVING, any type of JOINs.

SELECT pizza_name FROM menu
INTERSECT
SELECT pizza_name FROM menu
ORDER BY pizza_name DESC;