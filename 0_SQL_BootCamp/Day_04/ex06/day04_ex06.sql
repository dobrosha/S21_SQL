CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM person p
JOIN person_visits pv
    ON p.id = pv.person_id
JOIN pizzeria pz
    ON pv.pizzeria_id = pz.id
JOIN menu m
    ON pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800
ORDER BY 1;


-- SELECT *
-- FROM mv_dmitriy_visits_and_eats;