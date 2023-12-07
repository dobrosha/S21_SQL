-- Please write a SQL statement that returns the total volume (sum of all money) of transactions from
-- user balance aggregated by user and balance type. Please be aware, all data should be processed
-- including data with anomalies. Below presented a table of result columns and corresponding calculation
-- formula.

SELECT distinct
    name,
    lastname,
    type,
    sum(money::numeric) as volume,
    currency_name,
    last_rate_to_usd,
    (sum(money) * last_rate_to_usd) as total_volume_in_usd
FROM (
         SELECT distinct
             COALESCE(u.name, 'not defined') as name,
             COALESCE(u.lastname, 'not defined') as lastname,
             b.type,
             b.money,
             COALESCE(c.name, 'not defined') as currency_name,
             COALESCE(first_value(c.rate_to_usd) over(partition by c.id order by c.updated desc), 1) as last_rate_to_usd
         FROM balance b
         full JOIN "user" u
            ON b.user_id = u.id
         full JOIN currency c
            ON b.currency_id = c.id
     ) t1
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name desc, lastname, type