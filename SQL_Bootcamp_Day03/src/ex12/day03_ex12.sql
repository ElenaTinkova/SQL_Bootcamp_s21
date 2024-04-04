-- DENIED: Don’t use direct numbers for identifiers of Primary Key, and menu
-- Don’t use window functions like ROW_NUMBER( )
-- Don’t use atomic INSERT statements |
-- Please use “insert-select” pattern and generate_series(...)
-- register new orders from all persons for “greek pizza” on 25th of February 2022

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (generate_series(((SELECT MAX(id) FROM person_order) + 1),
        ((SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person)))),
        (generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person))),
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
        '2022-02-25';

-- SELECT * FROM person_order;