SELECT c.CustomerID, c.FullName, o.OrderID, o.BillAmount, mi.Name 
FROM 
customers AS c INNER JOIN bookings AS b ON c.CustomerID =b.CustomerID
INNER JOIN  orders AS o ON b.BookingID = o.BookingID
INNER JOIN menu AS m ON o.MenuID = m.MenuID 
INNER JOIN menuitems as mi ON m.ItemID = mi.ItemID
WHERE o.BillAmount > 150
ORDER BY o.BillAmount ASC;