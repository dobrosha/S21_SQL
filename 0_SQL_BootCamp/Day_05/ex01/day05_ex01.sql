-- Before further steps please write a SQL statement that returns pizzas’ and corresponding pizzeria names.
-- Please take a look at the sample result below (no sort needed).

-- планировщик будет использовать всё, что только можно, дабы избежать последовательного сканирования
SET enable_seqscan = off;
-- команда, которая выводит то, как работает ваш SQL в рамках базы данных, какие подтягиваются структуры, какие страницы, статистика и так далее
EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name as pizzeria_name
FROM menu m
JOIN pizzeria pz
    ON m.pizzeria_id = pz.id

-- Let’s provide proof that your indexes are working for your SQL.
-- The sample of proof is the output of the EXPLAIN ANALYZE command.
-- Please take a look at the sample output command.
-- ...
-- ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
-- ...
-- Hint: please think why your indexes are not working in a direct way and what should we do to enable it?

