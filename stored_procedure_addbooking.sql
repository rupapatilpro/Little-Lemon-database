DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //

CREATE PROCEDURE AddBooking(IN table_num INT, IN booking_date TIME, IN customer_id INT, IN employee_id INT)
BEGIN
	INSERT INTO bookings (TableNo, BookingSlot, CustomerID, EmployeeID)
    VALUES (table_num, booking_date, customer_id, employee_id);
    SELECT CONCAT('Table ', table_num, ' is succesfully booked') AS 'Booking status';
END //

DELIMITER ;

call AddBooking(4,"11:00:00", 1, 2)