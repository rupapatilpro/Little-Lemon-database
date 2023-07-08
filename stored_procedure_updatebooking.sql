DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking( IN booking_id INT, IN booking_time TIME)
BEGIN
	UPDATE bookings 
    SET  BookingSlot = booking_time WHERE BookingID = booking_id;
    SELECT CONCAT('The booking number ', booking_id, ' is succesfully updated, new BookingSlot is: ', booking_time) AS 'Confirmation';
END //

DELIMITER ;

call UpdateBooking(4, "11:00:00")