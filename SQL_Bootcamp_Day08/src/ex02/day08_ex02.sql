-- Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 4
WHERE name = 'Pizza Hut';

COMMIT;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 3.6
WHERE name = 'Pizza Hut';
-- транзакция не может быть сериализована из-за одновременного обновления строки другим процессом
-- после начала текущей транзакции. REPEATABLE READ гарантирует, что каждая транзакция видит
-- стабильный снимок базы данных
-- ERROR:  could not serialize access due to concurrent update

COMMIT;
-- выполняется откат транзакции
-- ROLLBACK

SELECT rating FROM pizzeria
WHERE name = 'Pizza Hut';
