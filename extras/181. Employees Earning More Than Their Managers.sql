SELECT t1.name AS Employee
FROM Employee t1, Employee t2
WHERE t1.managerId = t2.id AND t1.salary > t2.salary
