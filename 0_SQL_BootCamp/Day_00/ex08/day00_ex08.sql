SELECT *
FROM person_order
WHERE id % 2 = '0'
order by id asc;