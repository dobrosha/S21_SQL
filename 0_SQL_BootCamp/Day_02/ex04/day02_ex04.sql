SELECT
    m.pizza_name,
    pz.name as pizzeria_name,
    m.price
FROM pizzeria pz
INNER JOIN menu m
    ON pz.id = m.pizzeria_id
WHERE m.pizza_name = 'mushroom pizza' or m.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;