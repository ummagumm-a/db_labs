CREATE TABLE Account
(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    credit FLOAT NOT NULL,
    currency VARCHAR(5) NOT NULL,
    bank VARCHAR(15)
);

INSERT INTO Account 
VALUES (1, 'Account 1', 1000, 'RUB', 'SberBank'),
       (2, 'Account 2', 1000, 'RUB', 'Tinkoff'),
       (3, 'Account 3', 1000, 'RUB', 'SberBank'),
       (4, 'Fee', 0, 'RUB', ' ');

CREATE TABLE Transactions
(
    id SERIAL PRIMARY KEY,
    from_ INT,
    to_ INT,
    fee FLOAT,
    amount FLOAT,
    transactionDateTime TIMESTAMP DEFAULT current_timestamp,
    
    FOREIGN KEY (from_) REFERENCES Account(id),
    FOREIGN KEY (to_) REFERENCES Account(id)
);

CREATE PROCEDURE sendMoney(from_ INT, to_ INT, amount FLOAT) AS 
$$
DECLARE withdrawal FLOAT;
BEGIN
    
    DROP TABLE IF EXISTS bank1;
    DROP TABLE IF EXISTS bank2;

    -- Extract bank of sender
    CREATE TEMPORARY TABLE bank1 AS 
        SELECT bank FROM Account WHERE id = from_;
    -- Extract bank of receiver
    CREATE TEMPORARY TABLE bank2 AS 
        SELECT bank FROM Account WHERE id = to_;

    -- If banks are different
    IF NOT EXISTS (SELECT 1
               FROM bank1 NATURAL JOIN bank2) THEN 
        -- add fee
        withdrawal := amount + 30;
        
        -- Update total fee collected
        UPDATE account
        SET credit = credit + 30
        WHERE name = 'Fee';
    ELSE 
        withdrawal := amount;
    END IF;

    UPDATE Account 
    SET credit = credit - withdrawal
    WHERE id = from_;
    
    UPDATE Account 
    SET credit = credit + amount
    WHERE id = to_;

    -- Add transaction to history
    INSERT INTO Transactions
    VALUES (DEFAULT, from_, to_, withdrawal - amount, amount, DEFAULT);    
    
    COMMIT;
END;
$$ LANGUAGE plpgsql;