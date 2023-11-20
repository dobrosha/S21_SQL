WITH
    visit as (
    SELECT pz.name as pizzeria_name
    FROM pizzeria pz
    JOIN person_visits pv
        ON pz.id = pv.pizzeria_id
    JOIN person p
        ON pv.person_id = p.id
    WHERE p.name = 'Andrey'
),
 orders as (
     SELECT pz.name as pizzeria_name
     FROM pizzeria pz
     JOIN menu m
        ON pz.id = m.pizzeria_id
     JOIN person_order po
        ON m.id = po.menu_id
     JOIN person p
        ON po.person_id = p.id
     WHERE p.name = 'Andrey'
 )

SELECT * FROM visit
EXCEPT
SELECT * FROM orders
ORDER BY 1;
