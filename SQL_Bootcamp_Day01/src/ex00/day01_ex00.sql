-- returns menu’s identifier and pizza names from menu table
-- and person’s identifier and person name from person table
-- in one global list ordered by object_id and then by object_name columns.

SELECT menu.id AS object_id, menu.pizza_name AS object_name
FROM menu
UNION
SELECT person.id AS object_id, person.name AS object_name
FROM person
ORDER BY object_id, object_name;