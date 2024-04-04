-- Phantom Reads Anomaly under the REPEATABLE READ isolation level
-- summarize all ratings for all pizzerias in one transaction mode for Session #1
-- and then UPDATE the rating to 5 value for "Pizza Hut" restaurant in Session #2

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT SUM(rating) FROM pizzeria;

SELECT SUM(rating) FROM pizzeria;
COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE pizzeria SET rating = 5
WHERE name = 'Pizza Hut';

COMMIT;

SELECT SUM(rating) FROM pizzeria;