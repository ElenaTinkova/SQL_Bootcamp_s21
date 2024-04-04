-- A pl/pgsql function fnc_fibonacci with input integer parameter pstop (default is 10)
-- which returns a table of all Fibonacci numbers less than pstop.

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS SETOF integer
AS $$
DECLARE
    current_num integer := 0;
    next_num integer := 1;
    sum_num integer;
BEGIN
    IF current_num > pstop THEN
        RETURN NEXT 0;
    END IF;
    WHILE current_num < pstop LOOP
        RETURN NEXT current_num;
        sum_num := current_num + next_num;
        current_num := next_num;
        next_num := sum_num;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();