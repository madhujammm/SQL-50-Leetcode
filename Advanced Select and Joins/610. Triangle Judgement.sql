-- m1

SELECT x, y, z, 
       IF(x + y > z AND x + z > y AND y + z > x, 'Yes', 'No') AS triangle
FROM Triangle;


-- m2
SELECT x, y, z, 
       CASE 
           WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' 
           ELSE 'No' 
       END AS triangle
FROM Triangle;
