DELIMITER //
CREATE PROCEDURE IF NOT EXISTS UpdateBooking (booking_ref INT, book_date DATE)
BEGIN
UPDATE bookings SET booking_date = book_date
WHERE booking_id = booking_ref;
SELECT 'Booking updated !' AS 'Confirmation';
END //
DELIMITER ;

CALL UpdateBooking(14, "2023-10-18");





