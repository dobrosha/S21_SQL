-- Database Trigger Function for UPDATE
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS trigger AS $fnc_trg_person_update_audit$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit SELECT current_timestamp, 'U', NEW.*;
RETURN NEW;
END IF;
RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$fnc_trg_person_update_audit$ LANGUAGE plpgsql;

-- Database Trigger for UPDATE
CREATE TRIGGER trg_person_update_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

-- UPDATE person table
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- Check the result
-- select * from person_audit;