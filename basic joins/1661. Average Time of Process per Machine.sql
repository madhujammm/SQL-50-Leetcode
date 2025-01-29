WITH ProcessTimes AS (
    SELECT 
        machine_id, 
        process_id, 
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) - 
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS process_time
    FROM Activity
    GROUP BY machine_id, process_id
)
