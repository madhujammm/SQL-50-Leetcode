select distinct Num as ConsecutiveNums
from logs 
where (id+1,Num) in (select * from Logs) and(id+2, Num) in (select * from Logs )
