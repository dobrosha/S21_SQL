SELECT order_date as action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date, person_id
FROM person_visits
ORDER BY action_date asc, person_id desc;