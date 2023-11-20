SELECT m.pizza_name, m.price, pz.name as pizzeria_name, pv.visit_date
FROM person_visits pv
JOIN person p
  ON p.id = pv.person_id
JOIN menu m
  ON pv.pizzeria_id = m.pizzeria_id
JOIN pizzeria pz
  ON pv.pizzeria_id = pz.id
WHERE p.name = 'Kate' and m.price BETWEEN 800 AND 1000
ORDER BY 1,2,3