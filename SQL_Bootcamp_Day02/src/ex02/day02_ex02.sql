-- returns a whole list of person names visited (or not visited) pizzerias
-- during the period from 1st to 3rd of January 2022 from one side
-- and the whole list of pizzeria names which have been visited (or not visited) from the other side.
-- the substitution value ‘-’ for NULL values in person_name and pizzeria_name columns.

SELECT COALESCE(person.name, '-') AS person_name, visit.visit_date,
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM pizzeria
FULL JOIN (SELECT * FROM person_visits
            WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS visit
            ON pizzeria.id = visit.pizzeria_id
FULL JOIN person
ON person.id = visit.person_id
ORDER BY 1, 2, 3;