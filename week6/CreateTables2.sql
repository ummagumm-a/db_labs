CREATE TABLE IF NOT EXISTS Author 
(
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Book
(
    book_id INT PRIMARY KEY,
    book_title VARCHAR(50) NOT NULL,
    month_ VARCHAR(15),
    year_ INT,
    editor INT,
    
    FOREIGN KEY (editor) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS Pub
(
    pub_id INT, 
    title VARCHAR(50),
    book_id INT,
    
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE IF NOT EXISTS AuthorPub
(
    author_id INT,
    pub_id INT, 
    author_position INT
);

INSERT INTO Author
VALUES
    (1, 'John', 'McCarthy'),
    (2, 'Dennis','Ritchie'),
    (3, 'Ken', 'Thompson'),
    (4, 'Claude', 'Shannon'),
    (5, 'Alan', 'Turing'),
    (6, 'Alonzo', 'Church'),
    (7, 'Perry', 'White'),
    (8, 'Moshe', 'Vardi'),
    (9, 'Roy', 'Batty');

INSERT INTO Book 
VALUES
(1, 'CACM', 'April', 1960, 8),
(2, 'CACM', 'July', 1974, 8),
(3, 'BTS', 'July', 1948, 2),
(4, 'MLS', 'November', 1936, 7),
(5, 'Mind', 'October', 1950, NULL),
(6, 'AMS' ,'Month', 1941, NULL),
(7, 'AAAI', 'July', 2012, 9),
(8, 'NIPS', 'July', 2012, 9);

INSERT INTO Pub
VALUES 
    (1, 'LISP', 1),
    (2, 'UNIX', 2),
    (3, 'Info Theory', 3),
    (4, 'Turing Machines', 4),
    (5, 'Turing Test', 5),
    (6, 'Lambda Calculus', 6);
    
INSERT INTO AuthorPub
VALUES 
    (1, 1, 1),
    (2, 2, 1),
    (3, 2, 2),
    (4, 3, 1),
    (5, 4, 1),
    (5, 5, 1),
    (6, 6, 1);