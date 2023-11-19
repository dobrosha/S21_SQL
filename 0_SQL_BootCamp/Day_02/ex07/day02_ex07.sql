SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p
  ON p.id = pv.person_id
JOIN pizzeria pz
  ON pv.pizzeria_id = pz.id
JOIN menu m
  ON pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800;