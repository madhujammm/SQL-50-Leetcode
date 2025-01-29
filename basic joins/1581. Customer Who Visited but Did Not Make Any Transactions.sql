SELECT visits.customer_id,COUNT(*) AS count_no_trans
FROM Visits 
LEFT JOIN Transactions 
ON visits.visit_id = transactions.visit_id
WHERE transactions.transaction_id IS NULL
GROUP BY visits.customer_id;
