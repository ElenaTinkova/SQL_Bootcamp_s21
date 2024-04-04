-- returns the person's name and the corresponding number of visits to any pizzerias
-- if the person has visited more than 3 times (> 3)

SELECT person.name, COUNT(*) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
HAVING COUNT(*) > 3;