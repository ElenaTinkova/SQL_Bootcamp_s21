-- returns the orders with actual price and price with discount applied
-- for each person in the corresponding pizzeria restaurant,
-- sorted by person name and pizza name. Please see the sample data below.
--
-- name	    pizza_name	    price	discount_price	pizzeria_name
-- Andrey	cheese pizza	800	    624	            Dominos
-- Andrey	mushroom pizza	1100	858	            Dominos

SELECT person.name, menu.pizza_name, menu.price,
       ROUND(menu.price - (menu.price * discount/100)) AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN person_discounts ON person_discounts.person_id = person_order.person_id AND
                         person_discounts.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;