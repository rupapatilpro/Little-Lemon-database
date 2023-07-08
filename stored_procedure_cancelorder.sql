DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(inputid INT) 
BEGIN
DELETE FROM orders WHERE orders.OrderID = inputid; 
SELECT CONCAT("Order ", inputid, " is deleted") AS Confirmtion; 
END//
DELIMITER ;
call CancelOrder(5)
