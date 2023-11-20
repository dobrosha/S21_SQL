WITH
    male as (
        SELECT pz.name as pizzeria_name
        FROM person_order po
        JOIN menu m
            ON po.menu_id = m.id
        JOIN pizzeria pz
            ON m.pizzeria_id = pz.id
        JOIN person p
            ON po.person_id = p.id
        WHERE gender = 'male'
    ),

    female as (
        SELECT pz.name as pizzeria_name
        FROM person_order po
        JOIN menu m
            ON po.menu_id = m.id
        JOIN pizzeria pz
            ON m.pizzeria_id = pz.id
        JOIN person p
            ON po.person_id = p.id
        WHERE gender = 'female'
    ),

    male_only as (
        SELECT * FROM male
        EXCEPT
        SELECT * FROM female
    ),

    female_only as (
        SELECT * FROM female
        EXCEPT
        SELECT * FROM male
    )

SELECT *
FROM male_only
UNION
SELECT *
FROM female_only
ORDER BY 1;