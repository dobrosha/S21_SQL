SELECT coalesce(per.name, '-') AS person_name,
       pv.visit_date           AS visit_date,
       coalesce(piz.name, '-') AS pizzeria_name
FROM (SELECT *
      FROM person_visits
      WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
         FULL JOIN pizzeria piz on piz.id = pv.pizzeria_id
         FULL JOIN person per ON pv.person_id = per.id
ORDER BY person_name, visit_date, pizzeria_name;

-- select
--     coalesce(p.name, '-') as person_name,
--     pv.visit_date,
--     coalesce(pz.name, '-') as pizzeria_name
-- from pizzeria pz
--          full join (select * from person_visits
--                     where visit_date between '2022-01-01' and '2022-01-03') pv
--                    on pz.id = pv.pizzeria_id
--          full join person p on pv.person_id = p.id
-- order by 1,2,3