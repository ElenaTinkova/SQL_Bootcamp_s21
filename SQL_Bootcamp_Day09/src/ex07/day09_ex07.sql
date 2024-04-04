-- a function func_minimum that has an input parameter
-- that is an array of numbers and the function returns a minimum value.

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric
AS $$
BEGIN
    RETURN (
        SELECT MIN(num)
        FROM unnest(arr) AS num
        );
END;
$$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

DROP FUNCTION func_minimum(numeric[]);