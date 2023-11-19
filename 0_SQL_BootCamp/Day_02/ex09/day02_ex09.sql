WITH female AS (
SELECT p.name, m.pizza_name
FROM person p
JOIN person_order po
    ON p.id = po.person_id
JOIN menu m
    ON po.menu_id = m.id
WHERE p.gender = 'female'
)

SELECT name
FROM female
WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name
FROM female
WHERE pizza_name = 'cheese pizza'
ORDER BY name asc;