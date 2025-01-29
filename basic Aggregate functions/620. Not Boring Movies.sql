select * from cinema
where id % 2 = 1 AND description != 'boring'
order by rating DESC;
