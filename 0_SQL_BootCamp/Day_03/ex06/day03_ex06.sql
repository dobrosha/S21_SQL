WITH t as (
    SELECT m.id, m.pizza_name, pz.name, pz.id as pz_id, m.price
    FROM menu m
    JOIN pizzeria pz
        ON m.pizzeria_id = pz.id
)

SELECT t1.pizza_name, t1.name as pizzeria_name_1, t2.name as pizzeria_name_2, t1.price
FROM t t1
LEFT JOIN t t2
    ON t1.pizza_name = t2.pizza_name and t1.price = t2.price and t1.name != t2.name
WHERE t2.name is not null and t1.pz_id > t2.pz_id
ORDER BY 1;