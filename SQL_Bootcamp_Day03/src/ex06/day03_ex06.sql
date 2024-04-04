--  find the same pizza names who have the same price, but from different pizzerias.
--  the result is ordered by pizza name.
WITH p1 AS
    (SELECT pizza_name, pizzeria.name AS pizzeria_name_1, price, pizzeria_id
     FROM menu
     JOIN pizzeria ON pizzeria.id = menu.pizzeria_id)

SELECT p1.pizza_name, p1.pizzeria_name_1, p2.pizzeria_name_1 AS pizzeria_name_2, p1.price
FROM p1
JOIN pizzeria ON pizzeria.id = p1.pizzeria_id
JOIN p1 p2 ON p1.pizza_name = p2.pizza_name AND p1.price = p2.price
AND p1.pizzeria_id > p2.pizzeria_id
ORDER BY 1;
