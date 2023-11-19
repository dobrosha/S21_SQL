SELECT coalesce(per.name, '-') AS person_name,
       pv.visit_date           AS visit_date,
       coalesce(piz.name, '-') AS pizzeria_name
FROM (SELECT *
      FROM person_visits
      WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
         FULL JOIN pizzeria piz on piz.id = pv.pizzeria_id
         FULL JOIN person per ON pv.person_id = per.id
ORDER BY person_name, visit_date, pizzeria_name;