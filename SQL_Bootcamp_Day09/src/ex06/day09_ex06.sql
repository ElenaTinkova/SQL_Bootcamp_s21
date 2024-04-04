-- a pl/pgsql function fnc_person_visits_and_eats_on_date based on an SQL statement
-- that finds the names of pizzerias that a person visited and
-- where he could buy pizza for less than the given amount in rubles
-- (IN pperson parameter with default value 'Dmitriy')
-- (IN pprice parameter with default value 500)
-- (IN pdate parameter with default value January 8, 2022).

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-08')
RETURNS TABLE (pizzeria_name varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN person_visits pv ON pv.pizzeria_id = p.id
    JOIN menu m ON m.pizzeria_id = p.id
    JOIN person ON pv.person_id = person.id
    WHERE person.name = pperson AND
    m.price < pprice AND
    pv.visit_date = pdate;
END
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');