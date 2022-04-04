INSERT INTO Customer
VALUES (101, 'Martin', 'Prague'),
       (107, 'Herman', 'Madrid'),
       (110, 'Pedro', 'Moscow');
       
INSERT INTO Item
VALUES (3786, 'Net', 35.0),
       (4011, 'Racket', 65.0),
       (9132, 'Pack-3', 4.75),
       (5794, 'Pack-6', 5.0),
       (3141, 'Cover', 10.0);
       
INSERT INTO Order_T
VALUES (2301, 101, 3786, 3),
       (2301, 101, 4011, 6),
       (2301, 101, 9132, 8),
       (2302, 107, 5794, 4),
       (2303, 110, 4011, 2),
       (2303, 110, 3141, 2);
       
INSERT INTO Order_Date
VALUES (2301, '2011-02-23'),
       (2302, '2011-02-25'),
       (2303, '2011-02-27');