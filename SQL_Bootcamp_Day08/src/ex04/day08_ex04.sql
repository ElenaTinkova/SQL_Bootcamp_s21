-- Non-Repeatable Reads under the SERIALIZABLE isolation level
-- check a rating for "Pizza Hut" in a transaction mode for Session #1,
-- and then make an UPDATE of the rating to a value of 3.0 in Session #2

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';

COMMIT;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';