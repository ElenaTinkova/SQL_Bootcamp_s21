-- returns a list of pizzerias which Andrey visited but did not make any orders.
-- Please order by the pizzeria name
WITH andrey_orders AS
    (
        SELECT pizzeria.name AS pin
        FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        JOIN person ON person.id = person_order.person_id
        WHERE person.name = 'Andrey'
    )

SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'
  AND pizzeria.name NOT IN (SELECT pin FROM andrey_orders)
ORDER BY 1;