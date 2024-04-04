-- modify statement from Exercise 00 and return a person name (not an identifier).
-- Additional clause is we need to see only top 4 people with maximum visits in each pizzerias
-- and sorted by a person name

SELECT person.name, COUNT(*) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
ORDER BY count_of_visits DESC, person.name
LIMIT 4;