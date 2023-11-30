create table person_audit
( created timestamp with time zone not null default current_timestamp,
  type_event char(1) default 'I' not null,
  row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar,
  constraint ch_type_event check ( type_event in ('I','U','D'))
);

-- Database Trigger Function
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $fnc_trg_person_insert_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.*;
RETURN NEW;
END IF;
RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

-- Database Trigger
CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- Insert into person
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- Check the result
-- select * from person_audit;