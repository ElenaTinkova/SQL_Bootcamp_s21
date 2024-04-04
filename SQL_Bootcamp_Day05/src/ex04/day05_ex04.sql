-- create a unique BTree index with the name idx_menu_unique
-- on the menu table for pizzeria_id and pizza_name columns.

CREATE UNIQUE INDEX idx_menu_unique
ON menu (pizzeria_id, pizza_name);

set enable_seqscan = false;

EXPLAIN ANALYSE
SELECT * FROM menu
WHERE pizzeria_id = 6 AND pizza_name = 'sausage pizza';