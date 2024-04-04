-- Phantom Reads Anomaly under the READ COMMITTED isolation level
-- summarize all ratings for all pizzerias in one transaction mode for Session #1
-- and then UPDATE the rating to 1 value for "Pizza Hut" restaurant in Session #2

-- Session #1
BEGIN;

SELECT SUM(rating) FROM pizzeria;

SELECT SUM(rating) FROM pizzeria;
COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 1
WHERE name = 'Pizza Hut';

COMMIT;

SELECT SUM(rating) FROM pizzeria;