-- find pizzerias that have been visited more often by women or by men.
-- For any SQL operators with sets save duplicates (UNION ALL, EXCEPT ALL, INTERSECT ALL).
-- Please sort a result by the pizzeria name.

WITH visit_counts AS (
    SELECT
        person.gender,
        pizzeria.id AS pid,
        COUNT(*) AS visit_count
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    GROUP BY pid, gender
    )

SELECT
    pizzeria.name AS pizzeria_name
FROM visit_counts female_vc
JOIN pizzeria ON female_vc.pid = pizzeria.id
JOIN visit_counts male_vc ON female_vc.pid = male_vc.pid
WHERE female_vc.gender = 'female' AND male_vc.gender = 'male'
AND female_vc.visit_count <> male_vc.visit_count
ORDER BY 1;