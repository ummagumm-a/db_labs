INSERT INTO Schools
VALUES (1, 'Horizon Education Institute'),
       (2, 'Bright Institution ');
INSERT INTO Teachers
VALUES (1, 'Chad Russell'),
       (2, 'E.F.Codd'),
       (3, 'Jones Smith'),
       (4, 'Adam Baker');
INSERT INTO Courses
VALUES (1, 'Logical thinking'),
       (2, 'Wrtting'),
       (3, 'Numerical Thinking'),
       (4, 'Spatial, Temporal and Causal Thinking'),
       (5, 'English');
INSERT INTO Rooms
VALUES (1, '1.A01'),
       (2, '2.B01');
INSERT INTO Publishers
VALUES (1, 'BOA Editions'),
       (2, 'Taylor & Francis Publishing'),
       (3, 'Prentice Hall'),
       (4, 'McGraw Hill');
INSERT INTO Books
VALUES (1, 'Learning and teaching in early childhood',1),
       (2, 'Preschool,N56',2),
       (3, 'Early Childhood Education N9',3),
       (4, 'Know how to educate: guide for Parents and',4);

INSERT INTO LoanBooks
VALUES
(1,1,1,1,1,1,'2010-09-09'),
(1,1,2,1,1,2,'2010-05-05'),
(1,1,3,1,1,1,'2010-05-05'),
(1,2,4,2,1,3,'2010-05-06'),
(1,2,3,2,1,1,'2010-05-06'),
(1,3,2,1,2,1,'2010-09-09'),
(1,3,5,1,2,4,'2010-05-05'),
(2,4,1,2,1,4,'2010-12-18'),
(2,4,3,2,1,1,'2010-05-06');