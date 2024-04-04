-- Denied any type of JOINs
-- find all menu identifiers which are not ordered by anyone.
-- The result should be sorted by identifiers.

SELECT id AS menu_id
FROM menu
WHERE id NOT IN (SELECT menu_id FROM person_order)
ORDER BY id;