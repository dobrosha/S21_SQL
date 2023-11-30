-- Please create a partial unique BTree index with the name idx_person_order_order_date on the person_order
-- table for person_id and menu_id attributes with partial uniqueness for order_date column for date ‘2022-01-01’.
-- The EXPLAIN ANALYZE command should return  the next pattern
-- "Index Only Scan using idx_person_order_order_date on person_order …"

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id)
WHERE (order_date = '2022-01-01');

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01'