-- Please take a look at SQL below from a technical perspective (ignore a logical case of that SQL statement) .

-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM  menu m
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;

-- Create a new BTree index with name idx_1 which should improve the “Execution Time” metric of this SQL.
-- Please provide proof (EXPLAIN ANALYZE) that SQL was improved.
-- Hint: this exercise looks like a “brute force” task to find a good covering index therefore
-- before your new test remove idx_1 index.

CREATE INDEX idx_1 ON pizzeria(rating);

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
          INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- DROP INDEX idx_1;
--
-- SET enable_seqscan = off;
-- EXPLAIN ANALYZE
-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM menu m
--           INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;