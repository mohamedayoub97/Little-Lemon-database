DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CancelBooking (booking_ref INT)
BEGIN
DELETE FROM bookings
WHERE booking_id = booking_ref;
SELECT CONCAT("Booking ", booking_ref, " cancelled !") AS 'Confirmation';
END //
DELIMITER ;

CALL CancelBooking(13);
