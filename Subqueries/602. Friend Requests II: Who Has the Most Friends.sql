WITH FriendCounts AS (
    SELECT requester_id AS id, COUNT(accepter_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS id, COUNT(requester_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
),
AggregatedCounts AS (
    SELECT id, SUM(num) AS total_friends
    FROM FriendCounts
    GROUP BY id
)
SELECT id, total_friends AS num
FROM AggregatedCounts
ORDER BY num DESC
LIMIT 1;

