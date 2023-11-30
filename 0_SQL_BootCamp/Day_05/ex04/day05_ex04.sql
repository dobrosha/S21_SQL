-- Please create a unique BTree index with the name idx_menu_unique on the menu table for
-- pizzeria_id and pizza_name columns.
-- Please write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_menu_unique is working.

-- Команда CREATE UNIQUE INDEX создает уникальный индекс в таблице (повторяющиеся значения не допускаются)
CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza'