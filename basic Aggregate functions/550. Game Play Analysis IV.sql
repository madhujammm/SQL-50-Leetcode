WITH base AS (
SELECT
    player_id,
    MIN(event_date) AS first_event_date
    -- LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) as leading
from activity
GROUP BY 1
),
consecutive AS (
SELECT
    a.player_id
FROM activity AS a
LEFT JOIN base ON base.player_id = a.player_id
WHERE 
    DATEDIFF(event_date, first_event_date) = 1
)
SELECT
    ROUND(COUNT(DISTINCT c.player_id)/ (SELECT COUNT(DISTINCT player_id) FROM activity), 2) AS fraction
FROM consecutive AS c
