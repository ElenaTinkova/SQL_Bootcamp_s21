-- a SQL statement to see 3 favorite restaurants by visits and by orders in a list
-- add an action_type column with values 'order' or 'visit'
-- The result sorted in ascending order by the action_type column and in descending order by the count column.

(SELECT pizzeria.name, COUNT(*) AS count,
        'order' AS action_type
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type, count DESC
LIMIT 3)
UNION
(SELECT pizzeria.name, COUNT(*) AS count,
        'visit' AS action_type
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY action_type, count DESC
LIMIT 3)
ORDER BY action_type, count DESC;