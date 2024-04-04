-- create a functional B-Tree index with name idx_person_name
-- Index should contain person names in upper case.

CREATE INDEX idx_person_name ON person(upper(name));

set enable_seqscan = false;
EXPLAIN ANALYZE
SELECT * FROM person
WHERE upper(name) = 'IRINA';