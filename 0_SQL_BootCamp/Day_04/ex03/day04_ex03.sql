SELECT generated_date as missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY missing_date

-- SELECT generated_date AS missing_date
-- FROM v_generated_dates
-- WHERE generated_date NOT IN (SELECT visit_date FROM person_visits)
-- ORDER BY 1;