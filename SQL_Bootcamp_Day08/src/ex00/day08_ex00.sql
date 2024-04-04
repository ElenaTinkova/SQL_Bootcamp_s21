-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5
WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

-- Session #2
-- before commit
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- after commit
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';