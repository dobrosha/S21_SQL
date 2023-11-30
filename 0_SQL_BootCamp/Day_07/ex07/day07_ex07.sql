-- Please write a SQL statement that returns a common average rating (the output attribute name is global_rating)
-- for all restaurants. Round your average rating to 4 floating numbers.

SELECT round(avg(rating),4) as global_rating
FROM pizzeria;