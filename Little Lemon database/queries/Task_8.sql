DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CheckBooking (book_date DATE, book_time TIME, table_num INT)
BEGIN
DECLARE table_booked INT DEFAULT 0;
SELECT 
    COUNT(table_booked)
INTO table_booked FROM
    bookings
WHERE
    booking_date = book_date
        AND booking_time = book_time
        AND table_no = table_num;
    IF table_booked > 0 THEN
      SELECT CONCAT( "Table ",table_num, " is already booked at ",book_time, " on ", book_date,".") AS "Booking status";
      ELSE 
      SELECT CONCAT( "Table ",table_num," is not booked at ",book_time," on ",book_date,".") AS "Booking status";
    END IF;
END//
DELIMITER ;

CALL CheckBooking("2022-10-10", "21:00:00", 5);