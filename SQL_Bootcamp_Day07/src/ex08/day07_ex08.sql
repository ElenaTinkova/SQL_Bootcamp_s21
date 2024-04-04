-- returns the address, the name of the pizzeria, and the amount of the person's orders.
-- The result should be sorted by address and then by restaurant name.

SELECT person.address, pizzeria.name, COUNT(*) AS count_of_orders
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY person.address, pizzeria.name;