DROP PROCEDURE IF EXISTS DeleteBooking;
DELIMITER //

CREATE PROCEDURE DeleteBooking( IN booking_id INT)
BEGIN
	DELETE FROM bookings WHERE BookingID = booking_id;
    SELECT CONCAT('The booking number ', booking_id, ' is succesfully deleted') AS 'Confirmation';
END //

DELIMITER ;

call DeleteBooking(17)