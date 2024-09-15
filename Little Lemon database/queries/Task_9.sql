DELIMITER //
CREATE PROCEDURE IF NOT EXISTS AddValidBooking (table_nb INT, staff_id INT, book_date DATE, cust_id CHAR(11), book_time TIME)
BEGIN
START TRANSACTION;
	SELECT 1 AS 'status'
	FROM bookings 
	WHERE booking_date = book_date
	AND table_no = table_nb
	AND booking_time = book_time
	LIMIT 1
	INTO @booking_status;

IF @booking_status = 1 THEN
	ROLLBACK;
	SELECT CONCAT("A client has already booked table ", table_nb, " on ", book_date, " at ", book_time, ". Cannot add booking. Transaction cancelled.") AS 'Booking status';

ELSE
	INSERT INTO bookings (table_no, booking_staff_id, booking_date, booking_customer_id, booking_time ) VALUES 
	(table_nb, staff_id, book_date, cust_id, book_time);
COMMIT;

SELECT CONCAT("Table ", table_number, " is free - booking successful.") AS 'Booking status';
END IF;
END //

DELIMITER ;

CALL AddValidBooking(5, 2, "2022-10-10", "87-599-0366","21:00:00");

