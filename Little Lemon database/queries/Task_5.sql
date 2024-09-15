PREPARE GetOrderDetails FROM 
	'SELECT 
   	    order_id, 
            quantity,
            cost
	FROM orders
        WHERE order_customer_id = ?';

SET @order_customer_id = '01-010-4453'; 

EXECUTE GetOrderDetails USING @order_customer_id;