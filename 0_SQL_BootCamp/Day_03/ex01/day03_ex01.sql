SELECT id as menu_id
FROM menu m
WHERE NOT EXISTS (SELECT 1 FROM person_order po WHERE po.menu_id = m.id)
ORDER BY 1

-- SELECT m.id AS menu_id
-- FROM menu m
-- EXCEPT
-- SELECT po.menu_id
-- FROM person_order po
-- ORDER BY menu_id;