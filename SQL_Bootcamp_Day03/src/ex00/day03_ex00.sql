-- returns a list of pizza names, pizza prices, pizzerias names and dates of visit
-- for Kate and for prices in range from 800 to 1000 rubles.
-- Please sort by pizza, price and pizzeria names.

SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE price BETWEEN 800 AND 1000 AND person.name = 'Kate'
ORDER BY pizza_name, price, pizzeria_name;