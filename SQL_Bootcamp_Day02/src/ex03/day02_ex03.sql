WITH missing_days AS
(SELECT * FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS md
LEFT JOIN person_visits
ON md = person_visits.visit_date AND (person_id = 1 OR person_id = 2)
WHERE person_id IS NULL)

SELECT md::date AS missing_date FROM missing_days
ORDER BY missing_date;