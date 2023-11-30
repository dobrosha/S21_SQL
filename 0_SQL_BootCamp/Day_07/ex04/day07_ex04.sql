-- Please write a SQL statement that returns the person name and corresponding number of visits in any
-- pizzerias if the person has visited more than 3 times (> 3).Please take a look at the sample of data below.
-- DO NOT USE "WHERE"

SELECT p.name, count(*) as count_of_visits
FROM person_visits pv
JOIN person p
    ON pv.person_id = p.id
GROUP BY p.name
HAVING count(*) > 3