SELECT orderId, sum(quantity), sum(quantity * price)
FROM Order_T NATURAL JOIN Item
GROUP BY orderId;

SELECT customerId
FROM Order_T NATURAL JOIN Item NATURAL JOIN Customer
GROUP BY customerId 
ORDER BY sum(quantity * price) desc
FETCH FIRST 1 ROWS ONLY;