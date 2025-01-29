SELECT Employee.name 
FROM Employee 
JOIN Employee AS DirectReports 
ON Employee.id = DirectReports.managerId
GROUP BY Employee.id, Employee.name
HAVING COUNT(DirectReports.id) >= 5;
