/* returns the person's identifiers (without duplication) who visited pizzerias
   in a period from 6th of January 2022 to 9th of January 2022
   or visited pizzeria with identifier 2.
   sorted by id-person in descending order
 */

SELECT DISTINCT person_id
FROM person_visits
WHERE visit_date BETWEEN '2022-01-06' AND '2022-01-09'
   OR pizzeria_id = 2
ORDER BY person_id DESC;
