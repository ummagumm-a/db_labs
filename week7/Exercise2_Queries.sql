SELECT s.name as school, count(b.id),p.name as publisher
    FROM loanbooks as l,schools as s, publishers as p, books as b
    WHERE l.schoolid = s.id AND l.bookid = b.id AND b.pulbisherid = p.id
    GROUP BY s.name, p.name
    ORDER BY s.name;

SELECT s.name AS "school" ,l.loandate,b.name AS "book",t.name AS "teacher"
FROM loanbooks as l
    JOIN teachers AS t ON t.id = l.teacherid JOIN schools AS s ON s.id = t.id JOIN books AS b ON b.id = l.bookid
    JOIN ( SELECT s.id,MIN(l.loandate) 
          FROM loanbooks as l JOIN teachers AS t ON t.id = l.teacherid JOIN schools AS s ON s.id = l.schoolid
        GROUP BY s.id
    ) AS m ON m.id = s.id
WHERE l.loandate = m.min;