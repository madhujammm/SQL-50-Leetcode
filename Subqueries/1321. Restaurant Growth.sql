
WITH DailyTotal AS (
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
),
MovingAvg AS (
    SELECT d1.visited_on, 
           SUM(d2.total_amount) AS amount, 
           ROUND(AVG(d2.total_amount), 2) AS average_amount
    FROM DailyTotal d1
    JOIN DailyTotal d2 
        ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
    GROUP BY d1.visited_on
    HAVING COUNT(d2.visited_on) = 7
)
SELECT visited_on, amount, average_amount
FROM MovingAvg
ORDER BY visited_on;



-- better method 
SELECT 
    visited_on,
    ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING), 2) AS amount,
    ROUND(AVG(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING), 2) AS average_amount
FROM (
    SELECT visited_on, COUNT(DISTINCT customer_id) AS customer_count,
    SUM(amount) as amount
    FROM Customer
    GROUP BY visited_on
) AS subq
ORDER BY visited_on
LIMIT 100 OFFSET 6;
