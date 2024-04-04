-- (R - S)∪(S - R)
-- Where R is the person_visits table with filter by 2nd of January 2022,
-- S is also person_visits table but with filter by 6th of January 2022.
-- sort by person_id column
-- please present in v_symmetric_union (*) database view.

CREATE VIEW v_symmetric_union AS
(SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-02'
EXCEPT
SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-06')
UNION
(SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-06'
EXCEPT
SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-02')
ORDER BY person_id;