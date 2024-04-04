-- return information about all pizzeria names and prices to get mushroom or pepperoni pizzas.
-- sort the result by pizza name and pizzeria name then.


WITH pizza_info AS
    (SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, price
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')

SELECT *
FROM pizza_info
ORDER BY pizza_name, pizzeria_name;