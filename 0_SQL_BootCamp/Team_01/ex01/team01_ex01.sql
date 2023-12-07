-- Before deeper diving into this task please apply INSERTs statements below.

-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    t.name,
    t.lastname,
    currency_name,
    money * rate_to_usd AS currency_in_usd
FROM (
         SELECT
             COALESCE(u.name, 'not defined') AS name,
             COALESCE(u.lastname, 'not defined') AS lastname,
             c.name AS currency_name,
             b.money,
             COALESCE((select rate_to_usd
                       from currency c
                       where b.currency_id = c.id and c.updated < b.updated
                       order by c.updated desc
                      limit 1),
				(select rate_to_usd
				from currency c
				where b.currency_id = c.id and c.updated > b.updated
				order by c.updated asc
				limit 1
				)) AS rate_to_usd
         FROM balance b
         INNER JOIN (select c.id, c.name from currency c group by c.id, c.name) as c
            ON c.id = b.currency_id
         LEFT JOIN "user" u
            ON b.user_id = u.id
     ) t
ORDER BY 1 desc, 2, 3


