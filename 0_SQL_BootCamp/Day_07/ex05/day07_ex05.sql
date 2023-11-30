-- Please write a simple SQL query that returns a list of unique person names who made orders in any pizzerias.
-- The result should be sorted by person name. Please take a look at the sample below.

SELECT distinct p.name
FROM person_order po
JOIN person p
    ON po.person_id = p.id
ORDER BY p.name