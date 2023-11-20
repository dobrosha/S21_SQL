WITH not_order AS (
    SELECT id as menu_id
    FROM menu m
    WHERE NOT EXISTS (SELECT 1 FROM person_order po WHERE po.menu_id = m.id)
    ORDER BY 1
)

SELECT m.pizza_name, m.price, pz.name as pizzeria_name
FROM not_order no
JOIN menu m
    ON no.menu_id = m.id
JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
ORDER BY 1,2;