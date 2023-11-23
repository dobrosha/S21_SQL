CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, ROUND(m.price - m.price*0.1) as discount_price
FROM person_order po
JOIN person p
    ON po.person_id = p.id
JOIN menu m
    ON po.menu_id = m.id
ORDER BY 1, 2

-- select * from v_price_with_discount