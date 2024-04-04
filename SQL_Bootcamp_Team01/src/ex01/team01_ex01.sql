CREATE OR REPLACE FUNCTION func_rate_min(p_currency_id integer, p_balance_updated timestamp)
RETURNS numeric AS $$
DECLARE
    v_rate numeric;
BEGIN
        SELECT rate_to_usd
            INTO v_rate
        FROM currency
        WHERE currency.id = p_currency_id
            AND currency.updated <= p_balance_updated
        ORDER BY updated DESC
        LIMIT 1;
        -- если не удалось найти курс к доллару
    -- выбираем первый курс для данной валюты
    IF v_rate IS NULL THEN
            SELECT rate_to_usd
                INTO v_rate
            FROM currency
            WHERE currency.id = p_currency_id
            ORDER BY updated
            LIMIT 1;
    END IF;
    RETURN v_rate;
END;
$$ LANGUAGE 'plpgsql';

WITH balance_cleared_cte AS (SELECT balance.user_id, money, currency_id, balance.updated
                             FROM balance
                             WHERE balance.currency_id IN (SELECT DISTINCT currency.id FROM currency))
SELECT DISTINCT COALESCE(u.name, 'not defined')        AS name,
       COALESCE(u.lastname, 'not defined')    AS lastname,
       c.name                                 AS currency_name,
       money * func_rate_min(balance_cleared_cte.currency_id, balance_cleared_cte.updated) AS currency_in_usd
FROM balance_cleared_cte
    LEFT JOIN "user" u ON u.id = balance_cleared_cte.user_id
         INNER JOIN currency c ON c.id = balance_cleared_cte.currency_id
ORDER BY 1 DESC, 2, 3;