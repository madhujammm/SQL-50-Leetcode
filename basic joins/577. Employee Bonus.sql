select Employee.name,Bonus.bonus
from Employee
left join Bonus
on Employee.empID = Bonus.empID
where Bonus.bonus < 1000 OR Bonus.bonus is NULL;

