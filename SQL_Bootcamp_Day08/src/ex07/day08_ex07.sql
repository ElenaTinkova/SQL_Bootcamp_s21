-- Deadlock (взаимная блокировка) — ситуация, когда две или более транзакций взаимно блокируют друг друга,
-- ожидая освобождения ресурсов, которые они же занимают. В результате ни одна из транзакций не может продвинуться,
-- и система входит в состояние взаимной блокировки

-- Session #1
BEGIN;

UPDATE pizzeria SET rating = 4.6
WHERE id = 1;

UPDATE pizzeria SET rating = 3.1
WHERE id = 2;

COMMIT;

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 5
WHERE id = 2;

UPDATE pizzeria SET rating = 0.3
WHERE id = 1;
--ERROR:  deadlock detected

COMMIT;
-- выполняется ROLLBACK