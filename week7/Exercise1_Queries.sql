SELECT orderId, sum(quantity), sum(quantity * price)
FROM Order_T NATURAL JOIN Item
GROUP BY orderId;

--SELECT customerName
--FROM 