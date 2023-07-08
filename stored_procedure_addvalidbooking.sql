DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date TIME, IN table_num INT)
BEGIN
    DECLARE booking_count INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO booking_count
    FROM bookings
    WHERE BookingSlot = booking_date AND TableNo = table_num;
    IF booking_count = 0 THEN
		INSERT INTO newbookings (BookingSlot, TableNo)
        VALUES (booking_date, table_num);
		COMMIT;
        SELECT CONCAT('Table ', table_num, ' is succesfully booked') AS 'Booking status';
    ELSE
		ROLLBACK;
        SELECT CONCAT('Booking canceled. Table ', table_num, ' is already booked') AS 'Booking status';
    END IF;
END //

DELIMITER ;

call AddValidBooking("10:00:00", 2)