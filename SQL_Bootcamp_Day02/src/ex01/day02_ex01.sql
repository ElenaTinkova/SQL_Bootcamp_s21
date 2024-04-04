-- returns the missing days from 1st to 10th of January 2022 (including all days)
-- for visits of persons with identifiers 1 or 2 (it means days missed by both).
-- order by visiting days in ascending mode.
-- DENIED: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT.

SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
LEFT JOIN person_visits
ON missing_date = person_visits.visit_date AND (person_id = 1 OR person_id = 2)
WHERE person_id IS NULL
ORDER BY missing_date;