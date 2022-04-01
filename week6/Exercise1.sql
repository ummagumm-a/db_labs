-- 1
select distinct sname
from supplierst 
natural inner join catalogt
natural inner join partst
where color = 'red';

-- 2
select distinct sid
from supplierst 
natural inner join catalogt
natural inner join partst
where color = 'red' or color = 'green';

-- 3
select distinct sid
from (supplierst 
natural inner join catalogt
natural inner join partst)
where color = 'red' or address = 'Carrot Patch, MN';

-- 4
SELECT DISTINCT C.sid
FROM CatalogT as C
WHERE NOT EXISTS(SELECT P.pid
         FROM PartsT as P
         WHERE (P.color = 'red'  or P.color = 'green')
         AND (NOT EXISTS (SELECT C1.sid
                  FROM CatalogT as C1
                  WHERE C1.sid = C.sid AND C1.pid = P.pid)));
                  
-- 5
SELECT DISTINCT C.sid
FROM CatalogT as C
WHERE (NOT EXISTS(SELECT P.pid
         FROM PartsT as P
         WHERE (P.color = 'red')
         AND (NOT EXISTS (SELECT C1.sid
                  FROM CatalogT as C1
                  WHERE C1.sid = C.sid AND C1.pid = P.pid)))
       OR NOT EXISTS(SELECT P.pid
         FROM PartsT as P
         WHERE (P.color = 'green')
         AND (NOT EXISTS (SELECT C1.sid
                  FROM CatalogT as C1
                  WHERE C1.sid = C.sid AND C1.pid = P.pid))));

-- 6
CREATE TEMP TABLE IF NOT EXISTS SupPartPairs AS 
SELECT * 
FROM (SuppliersT NATURAL INNER JOIN CatalogT
NATURAL INNER JOIN PartsT);
--
SELECT DISTINCT sp1.sid, sp2.sid
FROM SupPartPairs sp1 
    INNER JOIN SupPartPairs sp2 
    ON (sp1.cost_ > sp2.cost_ AND sp1.pid = sp2.pid);

-- 7
SELECT DISTINCT sp1.pid
FROM SupPartPairs sp1 
    INNER JOIN SupPartPairs sp2 
    ON (sp1.pid = sp2.pid AND NOT sp1.sid = sp2.sid);

-- 8
SELECT sid, color, avg(C.cost_)
FROM (SELECT * FROM SupPartPairs WHERE (color = 'red' OR color = 'green')) AS C
GROUP BY C.sid, C.color;

-- 9
SELECT DISTINCT sid
FROM SupPartPairs 
WHERE cost_ >= 50;