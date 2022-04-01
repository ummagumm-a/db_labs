CREATE TEMP TABLE StudCoursePair AS
    Students NATURAL JOIN Registration NATURAL JOIN Courses;

SELECT DISTINCT sname
FROM StudCoursePair 
WHERE (PERCENT > 90.0 AND cid = 107);

SELECT sid 
FROM (SELECT sid, min(percent) 
    FROM StudCoursePair 
    GROUP BY sid) AS C
WHERE min > 75.0;

SELECT sid, count(DISTINCT cid)
    (SELECT *
     FROM StudCoursePair 
     GROUP BY sid) AS C
WHERE count <= 2;