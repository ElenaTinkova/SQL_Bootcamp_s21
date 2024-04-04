COMMENT ON TABLE person_discounts IS 'This table contains information about discounts for the customers';
COMMENT ON COLUMN person_discounts.id IS 'The primary identifier';
COMMENT ON COLUMN person_discounts.person_id IS 'The id of the customer';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The id of the pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'The discount for the customer in the certain pizzeria';