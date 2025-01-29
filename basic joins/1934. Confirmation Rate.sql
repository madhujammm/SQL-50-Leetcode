SELECT Signups.user_id, 
       ROUND(IFNULL(SUM(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(Confirmations.user_id), 0), 2) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations
ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;
