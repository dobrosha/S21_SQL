-- We know about personal addresses from our data. Let’s imagine, that particular person visits pizzerias
-- in his/her city only. Please write a SQL statement that returns address, pizzeria name and amount
-- of persons’ orders. The result should be sorted by address and then by restaurant name.
-- Please take a look at the sample of output data below.

SELECT
    p.address,
    pz.name,
    count(*) as count_of_orders
FROM person_order po
JOIN menu m
    ON po.menu_id = m.id
JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
JOIN person p
    ON po.person_id = p.id
GROUP BY p.address, pz.name
ORDER BY 1, 2;