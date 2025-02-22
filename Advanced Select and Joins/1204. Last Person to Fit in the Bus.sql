-- M1 
select person_name from (
    select turn, person_name, weight, sum(weight) over(order by turn) as cumSum from Queue
) as t
where t.cumSum <= 1000 order by cumSum desc limit 1;

-- M2
WITH CTE AS (
    SELECT person_name, 
           weight, 
           turn,
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name 
FROM CTE
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
