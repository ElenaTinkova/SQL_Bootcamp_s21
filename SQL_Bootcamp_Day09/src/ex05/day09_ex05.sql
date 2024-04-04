-- a generic SQL function called fnc_persons with IN parameter pgender
-- with the default value = 'female'.

DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar default 'female')
RETURNS TABLE
    (
        id      person.id%TYPE,
        name    person.name%TYPE,
        age     person.age%TYPE,
        gender  person.gender%TYPE,
        address person.address%TYPE
    )
AS $$
SELECT * FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();