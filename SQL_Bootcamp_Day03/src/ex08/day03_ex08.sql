-- DENIED: don’t use direct numbers for identifiers of Primary Key and pizzeria
-- register a new pizza with name “sicilian pizza”
-- (whose id should be calculated by formula is “maximum id value + 1”)
-- with a price of 900 rubles in “Dominos” restaurant
-- (please use internal query to get identifier of pizzeria)

INSERT INTO menu
VALUES ((SELECT MAX(id) FROM menu)+1,
        (SELECT id FROM pizzeria
        WHERE name = 'Dominos'),
        'sicilian pizza', 900);

-- SELECT * FROM menu;