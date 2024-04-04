--  create a Materialized View mv_dmitriy_visits_and_eats (with data included)
--  based on SQL statement that finds the name of pizzeria Dmitriy
--  visited on January 8, 2022 and could eat pizzas for less than 800 rubles

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person_visits.visit_date = '2022-01-08' AND menu.price < 800 AND person.name = 'Dmitriy';