-- DENIED: Don’t use direct numbers for identifiers of Primary Key and pizzeria
-- register new orders from Denis and Irina on 24th of February 2022
-- for the new menu with “sicilian pizza”

INSERT INTO person_order
VALUES ((SELECT MAX(id) FROM person_order)+1,
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24'),

       ((SELECT MAX(id) FROM person_order)+2,
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');

-- SELECT * FROM person_order;