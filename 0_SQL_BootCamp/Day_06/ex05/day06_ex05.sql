-- To satisfy Data Governance Policies need to add comments for the table and table's columns.
-- Let’s apply this policy for the person_discounts table. Please add English or Russian comments
-- (it's up to you) that explain what is a business goal of a table and all included attributes.

COMMENT ON table person_discounts
    IS 'This table provides some information about person discount in each pizzeria';

COMMENT ON column person_discounts.id
	IS 'id - row identificator (PK)';

COMMENT ON column person_discounts.person_id
	IS 'person_id - person identificator';

COMMENT ON column person_discounts.pizzeria_id
	IS 'pizzeria_id - pizzeria identificator';

COMMENT ON column person_discounts.discount
	IS 'discount - person discount (0-100) for each pizzeria';