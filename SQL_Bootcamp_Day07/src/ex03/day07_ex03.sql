WITH orders_total AS
    (SELECT menu.pizzeria_id, COUNT(*) AS count
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    GROUP BY menu.pizzeria_id),

    visits_total AS
    (SELECT person_visits.pizzeria_id, COUNT(*) AS count
    FROM person_visits
    GROUP BY person_visits.pizzeria_id)

SELECT pizzeria.name,
       COALESCE(SUM(visits_total.count), 0) + COALESCE(SUM(orders_total.count), 0) AS total_count
FROM pizzeria
LEFT JOIN visits_total ON pizzeria.id = visits_total.pizzeria_id
LEFT JOIN orders_total ON orders_total.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY total_count DESC, name;
