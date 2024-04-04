SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       SUM(b.sum) AS volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       SUM(b.sum) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM (SELECT user_id, SUM(money) AS sum, type, currency_id
      FROM balance
GROUP BY user_id, type, currency_id) b
LEFT JOIN "user" u ON u.id = b.user_id
LEFT JOIN (SELECT DISTINCT ON (id) id, name, rate_to_usd
            FROM currency
            ORDER BY id, updated DESC) AS c ON b.currency_id = c.id
GROUP BY u.name, lastname, type, c.name, c.rate_to_usd
ORDER BY 1 DESC, 2, 3;