INSERT INTO bookings (booking_id, table_no, booking_staff_id, booking_date, booking_time, booking_customer_id)
VALUES
(11, 5, 1, '2022-10-10','21:00:00','26-237-6257'),
(12, 3, 1, '2022-11-12', '19:30:00', '15-541-9267'),
(13, 2, 5, '2022-10-11', '8:30:00', '77-064-4656'),
(14, 2, 2, '2022-10-13','19:30:00', '93-710-1150')
;

SELECT * FROM bookings WHERE booking_id >10;