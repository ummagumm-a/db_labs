SELECT *
FROM Author INNER JOIN Book ON author_id = editor;

SELECT (first_name, last_name)
FROM Author NATURAL JOIN (
    (SELECT author_id FROM Author)
        EXCEPT 
        (SELECT editor 
         FROM Book 
            INNER JOIN Author ON author_id = editor)) AS C;
            
SELECT *
FROM (SELECT author_id FROM Author EXCEPT SELECT editor FROM Book) AS C;