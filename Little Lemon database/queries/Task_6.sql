DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CancelOrder(IN canc_order CHAR(11))
BEGIN
	DELETE FROM orders WHERE order_id = canc_order;	
	SELECT 
    CONCAT('Order number ',
            canc_order,
            ' has been cancelled.') AS Confirmation;    
END //
DELIMITER ;

CALL CancelOrder('85-795-3011');