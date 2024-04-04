CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE
    (
        id      bigint,
        name    varchar,
        age     integer,
        gender  varchar,
        address varchar
    )
AS $$
    SELECT * FROM person
    WHERE gender = 'female';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons_male()
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
    WHERE gender ='male';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_male();