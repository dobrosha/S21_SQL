-- Looks like 2 functions from exercise 04 need a more generic approach. Please before our further
-- steps drop these functions from the database.
-- Write a common SQL-function (please be aware, not pl/pgsql-function) with the name fnc_persons.
-- This function should have an IN parameter pgender with default value = ‘female’.

DROP FUNCTION IF EXISTS public.fnc_persons_female();
DROP FUNCTION IF EXISTS public.fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgen varchar default 'female')
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$
(SELECT * FROM person WHERE person.gender = pgen);
$$ LANGUAGE sql;


-- select *
-- from fnc_persons(pgen := 'male');
--
-- select *
-- from fnc_persons();
