UPDATE menu
SET price = ROUND(price * 0.9)
WHERE pizza_name = 'greek pizza';

-- select * from menu
-- where pizza_name = 'greek pizza'