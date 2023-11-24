-- Please add a possibility to see additional rows with the most expensive cost to the SQL from previous exercise.
-- Just take a look at the sample of data below. Please sort data by total_cost and then by tour.

WITH RECURSIVE nodes AS (
  SELECT point1 AS path,
    point1, point2, cost
  FROM roads
  WHERE point1 = 'a'
  UNION
  SELECT CONCAT(nodes.path, ',', roads.point1) AS path,
    roads.point1, roads.point2,
    nodes.cost + roads.cost
  FROM nodes
    JOIN roads
    ON nodes.point2 = roads.point1
  WHERE path NOT LIKE CONCAT('%', roads.point1, '%')
  ), routes AS (
  SELECT cost AS total_cost,
    CONCAT('{', path, ',', point2, '}') AS tour
  FROM nodes
  WHERE LENGTH(path) = 7 AND point2 = 'a'
)
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM routes
)
UNION ALL
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MAX(total_cost)
  FROM routes
)
ORDER BY total_cost, tour;
