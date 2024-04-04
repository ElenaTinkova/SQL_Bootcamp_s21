-- find all pizza names (and corresponding pizzeria names using menu table)
-- that Denis or Anna ordered. Sort a result by both columns.
-- pizza_name   pizzeria_name

SELECT pizza_name, pizzeria.name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN (SELECT * FROM person
    JOIN person_order ON person.id = person_order.person_id
    WHERE name = 'Denis' or name = 'Anna') AS po
    ON menu.id = po.menu_id
ORDER BY 1, 2;