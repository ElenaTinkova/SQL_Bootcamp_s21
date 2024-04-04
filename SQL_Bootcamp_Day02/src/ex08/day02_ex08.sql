-- find the names of all males from Moscow or Samara cities
-- who orders either pepperoni or mushroom pizzas (or both)
-- order the result by person name in descending mode.

WITH needed_pizzas AS
    (SELECT * FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')

SELECT DISTINCT name FROM person
JOIN needed_pizzas AS pm
    ON pm.person_id = person.id
WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male'
ORDER BY name DESC;