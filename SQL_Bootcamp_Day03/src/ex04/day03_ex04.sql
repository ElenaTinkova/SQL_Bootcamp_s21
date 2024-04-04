--  find a union of pizzerias that have orders either from women or from men.
--  Other words, you should find a set of pizzerias names have been ordered by females only
--  and make "UNION" operation with set of pizzerias names have been ordered by males only.
--  Please be aware with word “only” for both genders.
--  For any SQL operators with sets don’t save duplicates (UNION, EXCEPT, INTERSECT).
--  Please sort a result by the pizzeria name

WITH all_persons AS
    (SELECT pizzeria.name AS pizzeria_name,
            person.gender
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person_order.person_id = person.id),
    females AS
    (SELECT pizzeria_name
    FROM all_persons
    WHERE gender = 'female'),
    males AS
    (SELECT pizzeria_name
    FROM all_persons
    WHERE gender = 'male'),

    only_females AS
    (SELECT * FROM females
    EXCEPT
    SELECT * FROM males),

    only_males AS
    (SELECT * FROM males
    EXCEPT
    SELECT * FROM females)

SELECT *
FROM only_females
UNION
SELECT *
FROM only_males
ORDER BY 1;