DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date TIME, IN table_num INT)
BEGIN
    DECLARE bookings_count INT;

    SELECT COUNT(*) INTO bookings_count
    FROM bookings
    WHERE BookingSlot = booking_date AND TableNo = table_num;

    IF bookings_count = 0 THEN
        SELECT 'Table is available' AS 'Booking status';
       ELSE
        SELECT CONCAT('Table ', table_num, ' is already booked') AS 'Booking status';
    END IF;
END //

DELIMITER ;

call CheckBooking("10:00:00", 2)