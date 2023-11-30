INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER() as id,
    person_id,
    pizzeria_id,
    case when orders_cnt = 1 then 10.5
         when orders_cnt = 2 then 22
         else 30
    end discount
FROM (
         SELECT
             po.person_id,
             m.pizzeria_id,
             count(po.person_id) as orders_cnt
         FROM person_order po
         JOIN menu m
            ON po.menu_id = m.id
         GROUP BY person_id, pizzeria_id
     )

-- SELECT
--     ROW_NUMBER() OVER() as id,
--         person_id,
--     pizzeria_id,
--     case when count(*) = 1 then 10.5
--          when count(*) = 2 then 22
--          else 30
--         end discount
-- FROM person_order po
--          JOIN menu m
--               ON po.menu_id = m.id
-- GROUP BY person_id, pizzeria_id