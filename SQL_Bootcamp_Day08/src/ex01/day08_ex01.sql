-- TRANSACTION ISOLATION LEVEL = read committed

-- Session #1
BEGIN; -- 1

SELECT * FROM pizzeria -- 3
WHERE name = 'Pizza Hut';

UPDATE pizzeria -- 5
SET rating = 4
WHERE name = 'Pizza Hut';

COMMIT; -- 7

SELECT * FROM pizzeria -- 9
WHERE name = 'Pizza Hut';

-- Session #2
BEGIN; -- 2

SELECT * FROM pizzeria -- 4
WHERE name = 'Pizza Hut';

UPDATE pizzeria -- 6
SET rating = 3.6
WHERE name = 'Pizza Hut';

COMMIT; -- 8

SELECT * FROM pizzeria -- 10
WHERE name = 'Pizza Hut';