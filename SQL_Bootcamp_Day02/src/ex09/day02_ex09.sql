-- find the names of all females who ordered both pepperoni and cheese pizzas
-- (at any time and in any pizzerias).
-- Make sure that the result is ordered by person name.

WITH ppr AS
    (SELECT pizza_name, person_id FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    WHERE pizza_name = 'pepperoni pizza'),
    chs AS
    (SELECT pizza_name, person_id FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    WHERE pizza_name = 'cheese pizza')

SELECT name FROM person
JOIN ppr ON ppr.person_id = person.id
JOIN chs ON chs.person_id = person.id
WHERE person.gender = 'female'
ORDER BY name;