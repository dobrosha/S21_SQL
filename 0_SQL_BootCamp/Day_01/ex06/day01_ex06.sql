SELECT po.order_date as action_date, (SELECT p.name FROM person p WHERE p.id = po.person_id) as person_name
FROM person_order po
INTERSECT
SELECT pv.visit_date, (SELECT p.name FROM person p WHERE p.id = pv.person_id) as person_name
FROM person_visits pv
ORDER BY action_date asc, person_name desc;