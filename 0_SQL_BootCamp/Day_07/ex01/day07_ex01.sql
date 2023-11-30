-- Please change a SQL statement from Exercise 00 and return a person name (not identifier).
-- Additional clause is  we need to see only top-4 persons with maximal visits in any pizzerias and sorted
-- by a person name.
-- Please take a look at the example of output data below.

SELECT p.name, count(*) as count_of_visits
FROM person_visits pv
JOIN person p
    ON pv.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name ASC
LIMIT 4;