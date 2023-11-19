SELECT p1.name as person_name1, p2.name as person_name2, p2.address as common_address
FROM person p1, person p2
WHERE p1.address = p2.address and p1.id > p2.id
ORDER BY 1,2,3 asc;