SELECT order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
NATURAL JOIN (SELECT name, age, id AS person_id
              FROM person) AS p
ORDER BY order_date, person_information;