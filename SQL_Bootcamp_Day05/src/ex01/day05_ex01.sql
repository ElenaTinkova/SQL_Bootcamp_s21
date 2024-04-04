-- write a SQL statement that returns pizzas’ and corresponding pizzeria names

set enable_seqscan = false;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;