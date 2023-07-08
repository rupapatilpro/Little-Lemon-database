SELECT menuitems.Name 
FROM menuitems INNER JOIN menu 
ON menu.ItemID = menuitems.ItemID
WHERE menu.MenuID = ANY (SELECT MenuID FROM orders WHERE Quantity > 2)