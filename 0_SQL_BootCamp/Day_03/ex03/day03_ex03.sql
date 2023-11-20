WITH
    male as (
        SELECT pz.name as pizzeria_name
        FROM person_visits pv
        JOIN pizzeria pz
            ON pv.pizzeria_id = pz.id
        JOIN person p
            ON pv.person_id = p.id
        WHERE gender = 'male'
    ),

    female as (
        SELECT pz.name as pizzeria_name
        FROM person_visits pv
        JOIN pizzeria pz
            ON pv.pizzeria_id = pz.id
        JOIN person p
            ON pv.person_id = p.id
        WHERE gender = 'female'
    ),

    male_only as (
        SELECT * FROM male
        EXCEPT ALL
        SELECT * FROM female
    ),

    female_only as (
        SELECT * FROM female
        EXCEPT ALL
        SELECT * FROM male
    )

SELECT *
FROM male_only
UNION ALL
SELECT *
FROM female_only
ORDER BY 1;