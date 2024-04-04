-- write a simple SQL query that returns a list of unique person names
-- who have placed orders at any pizzerias. The result should be sorted by person name.
-- denied: GROUP BY, any type (UNION,...) working with sets

SELECT DISTINCT person.name
FROM person_order
JOIN person ON person.id = person_order.person_id
ORDER BY 1;