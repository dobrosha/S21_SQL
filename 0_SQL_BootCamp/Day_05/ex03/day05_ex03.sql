-- Please create a better multicolumn B-Tree index with the name idx_person_order_multi for the SQL statement below.

-- SELECT person_id, menu_id,order_date
-- FROM person_order
-- WHERE person_id = 8 AND menu_id = 19;

-- The EXPLAIN ANALYZE command should return  the next pattern. Please pay attention to "Index Only Scan" scanning!

-- "Index Only Scan using idx_person_order_multi on person_order ..."

-- Please provide any SQL with proof (EXPLAIN ANALYZE) that index idx_person_order_multi is working.



CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;