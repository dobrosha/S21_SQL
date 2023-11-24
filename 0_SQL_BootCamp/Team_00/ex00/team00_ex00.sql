-- Please take a look at the Graph on the left.
-- There are 4 cities (a, b, c and d) and arcs between them with cost (or taxination). Actually the cost (a,b) = (b,a).
--
-- Please create a table with name nodes by using structure {point1, point2, cost} and fill data based on a picture
-- (remember there are direct and reverse paths between 2 nodes).
-- Please write one SQL statement that returns all tours (aka paths) with minimal traveling cost if we will start from city "a".
-- Just remember, you need to find the cheapest way of visiting all the cities and returning to your starting point. For example,
-- the tour looks like that a -> b -> c -> d -> a.
--
-- The sample of output data you can find below. Please sort data by total_cost and then by tour.

CREATE TABLE IF NOT EXISTS roads(
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER
);

INSERT INTO roads(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

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
ORDER BY total_cost, tour;
