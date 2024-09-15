DELIMITER //
CREATE PROCEDURE IF NOT EXISTS AddBooking (table_nb INT, staff_id INT, book_date DATE, cust_id CHAR(11), book_time TIME)
BEGIN
INSERT INTO bookings(table_no, booking_staff_id, booking_date, booking_customer_id, booking_time)
VALUES(table_nb, staff_id, book_date, cust_id, book_time);
SELECT 'Booking successful !' AS 'Confirmation';
END //
DELIMITER ;

CALL AddBooking(1, 1, "2022-10-18", "83-800-4789","19:00:00");