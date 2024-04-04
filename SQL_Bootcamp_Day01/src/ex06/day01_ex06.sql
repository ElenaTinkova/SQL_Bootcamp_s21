-- SELECT person_order.order_date AS action_date, name AS person_name
-- FROM person_order
-- JOIN person ON person_order.person_id = person.id
-- INTERSECT
-- SELECT person_visits.visit_date AS action_date, name AS person_name
-- FROM person_visits
-- JOIN person ON person_visits.person_id = person.id
-- ORDER BY action_date, person_name DESC;

SELECT DISTINCT person_order.order_date AS action_date, person.name AS person_name
FROM person_order
JOIN person_visits ON person_order.order_date = person_visits.visit_date
JOIN person ON person_order.person_id = person.id
ORDER BY action_date, person_name DESC;