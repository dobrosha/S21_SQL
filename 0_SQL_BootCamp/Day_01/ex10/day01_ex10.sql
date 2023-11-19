SELECT p.name as person_name,
       m.pizza_name,
       piz.name as pizzeria_name
FROM person p
INNER JOIN person_order po
    ON p.id = po.person_id
INNER JOIN menu m
    ON po.menu_id = m.id
INNER JOIN pizzeria piz
    ON m.pizzeria_id = piz.id
ORDER BY person_name, pizza_name, pizzeria_name;