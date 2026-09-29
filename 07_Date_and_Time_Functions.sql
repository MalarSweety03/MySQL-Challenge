-- MYSQL Challenege - Date_and_Time_Function

create database order_db;

use order_db;


CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    delivery_date DATE,
    order_time TIME
);



INSERT INTO orders
(order_id, customer_name, order_date, delivery_date, order_time)
VALUES
(101, 'Arun Kumar', '2026-01-15', '2026-01-20', '10:30:00'),
(102, 'Priya Sharma', '2026-02-05', '2026-02-10', '14:45:00'),
(103, 'Rahul Das', '2026-02-18', '2026-02-25', '09:15:00'),
(104, 'Meena Joseph', '2026-03-02', '2026-03-08', '16:20:00'),
(105, 'Karthik Raj', '2026-03-15', '2026-03-22', '11:10:00'),
(106, 'Divya Menon', '2026-04-01', '2026-04-05', '13:30:00'),
(107, 'Vijay Kumar', '2026-04-12', '2026-04-20', '08:45:00'),
(108, 'Anitha Paul', '2026-05-10', '2026-05-16', '17:00:00');






-- Question 1 — YEAR()

-- Display customer_name, order_date, and the year in which the order was placed.

select customer_name, order_date, year(order_date) as order_Year from orders;



-- Question 2 — MONTH()

-- Display customer_name, order_date, and the month number in which the order was placed.

select customer_name, order_date, month(order_date) as order_Month from orders;



-- Question 3 — DAY()

-- Display customer_name, order_date, and the day number from the order date.

select customer_name, order_date, day(order_date) as order_day from orders;



-- Question 4 — HOUR()

-- Display customer_name, order_time, and the hour from the order time.

select customer_name, order_time, hour(order_time) as order_hour from orders;



-- Question 5 — MINUTE()

-- Display customer_name, order_time, and the minute from the order time.

select customer_name, order_time, minute(order_time) as order_minute from orders;



-- Question 6 — SECOND()

-- Display customer_name, order_time, and the second from the order time.

select customer_name, order_time, second(order_time) as order_second from orders;



-- Question 7 — CURDATE()

-- Display the current date using MySQL.

select curdate() as Today ;



-- Question 8 — NOW()

-- Display the current date and current time using MySQL.

select now() as this_time;



-- Question 9 — DATEDIFF()

-- Display order_id, order_date, delivery_date, and calculate the number of days between the order date and delivery date.

select order_id, order_date, delivery_date, datediff(delivery_date, order_date) as no_of_days from orders;



-- Question 10 — DATE_ADD()

-- Display order_id, order_date, and create a new column showing the date 7 days after the order date.

select order_id, order_date, date_add(order_date, interval 7 day) as after7days from orders;



-- Question 11 — TIMESTAMPDIFF()

-- Display order_id, order_date, delivery_date, and calculate the number of days between the order date and delivery date using TIMESTAMPDIFF().

select order_id, order_date, delivery_date, timestampdiff(day, order_date, delivery_date) from orders;

