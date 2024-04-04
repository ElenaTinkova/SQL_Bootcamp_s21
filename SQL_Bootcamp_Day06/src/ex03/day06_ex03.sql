CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;

EXPLAIN ANALYZE
SELECT * FROM person_discounts
ORDER BY person_id;