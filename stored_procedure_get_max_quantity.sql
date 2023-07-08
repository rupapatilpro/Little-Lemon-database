DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity() 
SELECT MAX(Quantity) AS "Max Quantity in order" FROM orders;  
call GetMaxQuantity();
