EXPLAIN ANALYSE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- CREATE INDEX idx_1 ON menu(pizzeria_id); избыточный вариант, т.к.
-- у нас уже ранее был создан индекс idx_menu_unique

CREATE INDEX idx_1 ON pizzeria(rating);
set enable_seqscan = false;