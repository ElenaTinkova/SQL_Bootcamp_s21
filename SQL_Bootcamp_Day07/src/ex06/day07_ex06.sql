-- returns the number of orders, the average price, the maximum price and the minimum price
-- for pizzas sold by each pizzeria restaurant. The result should be sorted by pizzeria name.
-- Round the average price to 2 floating numbers.

SELECT pizzeria.name, COUNT(*) AS count_of_orders,
       ROUND(AVG(menu.price), 2) AS average_price,
       MAX(menu.price) AS max_price,
       MIN(menu.price) AS min_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;