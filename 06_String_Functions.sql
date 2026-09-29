-- MYSQL Challenege - String_Functions

create database Customer_db;

use Customer_db;



CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);



INSERT INTO customers
(customer_id, customer_name, city, email, phone)
VALUES
(101, 'Arun Kumar', 'Chennai', 'arun.kumar@gmail.com', '9876543210'),
(102, 'Priya Sharma', 'Madurai', 'priya.sharma@yahoo.com', '9876543211'),
(103, 'Rahul Das', 'Coimbatore', 'rahul.das@gmail.com', '9876543212'),
(104, 'Meena Joseph', 'Chennai', 'meena.joseph@outlook.com', '9876543213'),
(105, 'Karthik Raj', 'Trichy', 'karthik.raj@gmail.com', '9876543214'),
(106, 'Divya Menon', 'Madurai', 'divya.menon@yahoo.com', '9876543215'),
(107, 'Vijay Kumar', 'Salem', 'vijay.kumar@gmail.com', '9876543216'),
(108, 'Anitha Paul', 'Coimbatore', 'anitha.paul@outlook.com', '9876543217');



-- Question 1 — UPPER()

-- Display the customer name in uppercase.

select customer_name, upper(customer_name) as Upper_case from customers;



-- Question 2 — LOWER()

-- Display the customer name and the customer name in lowercase.

select customer_name, lower(customer_name) as lower_case from customers;



-- Question 3 — LENGTH()

-- Display the customer_name and the number of characters in each customer name.

select customer_name, length(customer_name) as num_character from customers;



-- Question 4 — CONCAT()

-- Display the customer_name and create a new column that combines customer_name and city, separated by a space.

select customer_name, city, concat(customer_name, ' ', city) as new_column from customers;



-- Question 5 — SUBSTRING()

-- Display the customer_name and extract the first 5 characters of each customer name.

select customer_name, substring(customer_name,1,5) as first5_character from customers;



-- Question 6 — TRIM()

-- Display the customer_name and remove any leading or trailing spaces from the customer name using TRIM().

select customer_name, trim(customer_name) as cleanname from customers;



-- Question 7 — LEFT()

-- Display customer_name and extract the first 3 characters of each customer name using LEFT().

select customer_name, Left(customer_name, 3) as Left_char from customers;




-- Question 8 — RIGHT()

-- Display customer_name and extract the last 4 characters of each customer name using RIGHT().

select customer_name, Right(customer_name, 4) as Right_char from customers;




-- Question 9 — REPLACE()

-- Display email and replace gmail.com with company.com in each email address.

select email, replace(email, 'gmail.com', 'company.com') as emailid from customers;



-- Question 10 — REVERSE()

-- Display customer_name and the customer name in reverse order.

select customer_name, Reverse(customer_name) as Reversename from customers;



-- Question 11 — LOCATE()

-- Display email and find the position of the @ symbol in each email address.

select email, locate('@', email) as symbol from customers;



-- Question 12 — LPAD()

-- Display customer_id and add leading zeros so that each ID has 6 digits.

select customer_id, lpad(customer_id, 6, 0) as leading_zero from customers;



-- Question 13 — RPAD()

-- Display customer_id and add 0 to the right side so that each ID has 6 digits.

select customer_id, rpad(customer_id, 6, 0) as leading_zero from customers;




-- Question 14 — Mixed String Functions

-- Display customer_name and create a new column containing the first 3 characters of the customer name in uppercase.

select customer_name, upper(left(customer_name,3)) as customername from customers;




-- Question 15 — Final Mixed Interview Question

-- Display email and create a new column containing the first 5 characters of the email in lowercase.

select email, lower(left(email, 5)) as email_id from customers;



