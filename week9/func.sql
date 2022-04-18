CREATE OR REPLACE FUNCTION func()
    RETURNS TABLE(address_id INT, address VARCHAR(50)) AS 
$$ 
BEGIN 
    RETURN QUERY
    
    SELECT address.address_id, address.address
    FROM address
    WHERE city_id BETWEEN 400 AND 600 
        AND address.address LIKE '%11%';
END; $$

LANGUAGE plpgsql;