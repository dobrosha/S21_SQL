-- Let’s create a Database Sequence with the name seq_person_discounts (starting from 1 value)
-- and set a default value for id attribute of person_discounts table to take a value from
-- seq_person_discounts each time automatically.
-- Please be aware that your next sequence number is 1, in this case please set an actual value for
-- database sequence based on formula “amount of rows in person_discounts table” + 1.
-- Otherwise you will get errors about Primary Key violation constraint.

-- CREATE SEQUENCE создаёт генератор последовательности
CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts ALTER COLUMN id SET default nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (select count(*) + 1 from person_discounts));

-- select *
-- from pg_sequences
-- where sequencename = 'seq_person_discounts'