-- Please write a SQL statement that returns aggregated information by person’s address , the result of
-- “Maximal Age - (Minimal Age  / Maximal Age)” that is presented as a formula column, next one is average
-- age per address and the result of comparison between formula and average columns (other words, if formula
-- is greater than  average then True, otherwise False value).
-- The result should be sorted by address column. Please take a look at the sample of output data below.

SELECT
    address,
    round((max(age) - min(age) / max(age::numeric)),2) as formula,
    round(avg(age),2) as average,
    case
        when round((max(age) - min(age) / max(age::numeric)),2) > round(avg(age),2) then 'true' else 'false'
    end comparison
FROM person
GROUP BY address
ORDER BY 1;