SELECT CONCAT(name, ' (age:', age, ',gender:''', gender, ''',address:''', address, ''')') as person_info
-- select (name || ' (age:' || age || ',gender:''' || gender || ''',address:''' || address || ''')')
FROM person
ORDER BY person_info asc;