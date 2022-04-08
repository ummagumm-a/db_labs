EXPLAIN ANALYZE SELECT sum(id)
FROM Customer
WHERE name = 'Kolya'
GROUP BY address;

EXPLAIN SELECT name FROM Customer WHERE Address = 'Lugansk';

EXPLAIN ANALYZE SELECT *
FROM Customer
WHERE name LIKE 'M%';

--CREATE INDEX hash_id ON Customer USING HASH (id);
--CREATE INDEX index_name ON Customer (name text_pattern_ops);
--CREATE INDEX hash_address ON Customer USING HASH (address);