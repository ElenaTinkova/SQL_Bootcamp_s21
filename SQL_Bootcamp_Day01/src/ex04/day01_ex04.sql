-- returns a difference (minus) of person_id column values with saving duplicates
-- between person_order table and person_visits table for order_date and visit_date
-- are for 7th of January of 2022

SELECT person_order.person_id AS person_id
FROM person_order
WHERE person_order.order_date = '2022-01-07'
EXCEPT ALL
SELECT person_visits.person_id AS person_id
FROM person_visits
WHERE person_visits.visit_date = '2022-01-07';