-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in one list
-- (please add an action_type column with values ‘order’ or ‘visit’, it depends on data from the
--  corresponding table). Please take a look at the sample of data below.
--  The result should be sorted by action_type column in ascending mode and by count column in descending mode.

(SELECT pz.name, count(*) as count, 'order' as action_type
FROM person_order po
JOIN menu m
    ON po.menu_id = m.id
JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count DESC LIMIT 3
)
UNION
(SELECT pz.name, count(*) as count, 'visit' as action_type
FROM person_visits pv
JOIN pizzeria pz
    ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC;