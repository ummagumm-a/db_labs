-- The table is already in 1NF

-- The table is not in 2NF because the primary key is 
-- (orderId, customerId, itemId) and price and itemName depend
--  only on itemId, customerName depends only on customerId. 
-- So, we can create three separate tables.

CREATE TABLE Customer
(
    customerId INT PRIMARY KEY,
    customerName VARCHAR(50),
    city VARCHAR(20)
);

CREATE TABLE Item
(
    itemId INT PRIMARY KEY,
    itemName VARCHAR(50),
    price FLOAT(24)
);

CREATE TABLE Order_Date
(
    orderId INT PRIMARY KEY,
    date_ DATE
);

CREATE TABLE Order_T 
(
    orderId INT NOT NULL,
    customerId INT NOT NULL,
    itemId INT NOT NULL,
    quantity INT,
    
    PRIMARY KEY (orderId, customerId, itemId),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId),
    FOREIGN KEY (itemId) REFERENCES Item(itemId)
);

-- Attributes in the table are not in any transitive relationship, 
-- so after transforming it to the 2NF it is also already in 3NF.