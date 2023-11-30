-- Please create a functional B-Tree index with name idx_person_name for the column name of the person table.
-- Index should contain person names in upper case.
-- Please write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_person_name is working.

-- EXPLAIN ANALYZE
-- SELECT *
-- FROM person
-- WHERE name = 'Kate'

CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT *
FROM person p
WHERE UPPER(p.name) = 'KATE'