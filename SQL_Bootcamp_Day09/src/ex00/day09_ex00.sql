CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    row_id BIGINT,
    name VARCHAR NOT NULL,
    age INTEGER NOT NULL,
    gender VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');