-- Session #1
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1
SELECT sum(rating) FROM pizzeria;
-- Session #2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;
-- Session #2
SELECT sum(rating) FROM pizzeria;