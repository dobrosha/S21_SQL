-- Please write a SQL statement to see restaurants are grouping by visits and by orders and joined with
-- each other by using restaurant name.
-- You can use internal SQLs from Exercise 02 (restaurants by visits and by orders) without limitations
-- of amount of rows.
-- Additionally, please add the next rules.

-- - calculate a sum of orders and visits for corresponding pizzeria (be aware, not all pizzeria keys are presented in both tables).
-- - sort results by total_count column in descending mode and by name in ascending mode.
-- Take a look at the data sample below.

WITH orders AS (
    SELECT pz.name, count(*) as count, 'order' as action_type
    FROM person_order po
    JOIN menu m
        ON po.menu_id = m.id
    JOIN pizzeria pz
        ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
),
visits AS (
SELECT pz.name, count(*) as count, 'visit' as action_type
FROM person_visits pv
JOIN pizzeria pz
    ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count DESC
),
statistic AS (
SELECT o.name, (o.count + v.count) AS total_count
FROM orders o
JOIN visits v
    ON v.name = o.name
)

SELECT pizzeria.name,
CASE
    WHEN total_count IS NULL THEN 0
    ELSE total_count
END total_count
FROM pizzeria
FULL JOIN statistic
    ON pizzeria.name = statistic.name
ORDER BY total_count DESC, name;


