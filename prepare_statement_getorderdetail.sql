PREPARE GetOrderDetail FROM 'SELECT o.OrderID, o.Quantity, o.BillAmount FROM orders AS o INNER JOIN bookings AS b ON o.BookingID = b.BookingID WHERE b.CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
