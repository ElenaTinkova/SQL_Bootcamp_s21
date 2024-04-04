-- find the name of pizzeria Dmitriy visited on January 8, 2022
-- and could eat pizza for less than 800 rubles.

WITH dmitriy_visit AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    WHERE person_visits.visit_date = '2022-01-08' AND menu.price < 800 AND person.name = 'Dmitriy')

SELECT * FROM dmitriy_visit;