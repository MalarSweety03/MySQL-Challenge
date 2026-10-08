-- MYSQL Challenege - Mathematical_Functions

create database product_db;

use product_db;


CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(10,2)
);

INSERT INTO products
(product_id, product_name, price, quantity, discount)
VALUES
(101, 'Laptop', 55000.75, 2, 1500.50),
(102, 'Mouse', 850.40, 5, 50.25),
(103, 'Keyboard', 1250.60, 3, 100.75),
(104, 'Monitor', 18500.90, 2, 750.40),
(105, 'Printer', 12500.35, 4, 500.25),
(106, 'Headset', 2450.80, 6, 150.60),
(107, 'Webcam', 3200.45, 3, 200.35),
(108, 'Tablet', 28000.95, 2, 1000.50);



-- Q1. ROUND()
-- Display the product_name, price, and the price rounded to 1 decimal place.

select product_name, price, round(price,1) from products;



-- Q2. ROUND()
-- Display the product_name, discount, and the discount rounded to the nearest whole number.

select product_name, discount, round(discount,0) from products;


-- Q3. ABS()
-- Display the product_name, price, and the absolute difference between the price and discount.

select product_name, price, discount, abs(price - discount) from products;


-- Q4. POWER()
-- Display the product_name, quantity, and the square of the quantity.

select product_name, quantity, power(quantity,2) as square_quan from products;



-- Q5. CEIL()
-- Display the product_name, price, and the price rounded up to the nearest whole number.

select product_name, price, ceil(price) from products;



-- Q6. FLOOR()
-- Display the product_name, price, and the price rounded down to the nearest whole number.

select product_name, price, floor(price) from products;



-- Q7. SQRT()
-- Display the product_name, quantity, and the square root of the quantity.

select product_name, quantity, sqrt(quantity) from products;



-- Q8. MOD()
-- Display the product_name, quantity, and the remainder when the quantity is divided by 2.

select product_name, quantity, mod(quantity,2) from products;



-- Q9. SIGN()
-- Display the product_name, discount, and the sign of the discount value.

select product_name, discount, sign(discount) from products;



-- Q10. GREATEST()
-- Display the product_name, price, discount, and the greater value between price and discount.

select product_name, price, discount, greatest(price, discount) from products;



-- Q11. LEAST()
-- Display the product_name, price, discount, and the smaller value between price and discount.

select product_name, price, discount, least(price, discount) from products;



-- Q12. RAND()
-- Display the product_name and generate a random number for each products;

select product_name, rand() from products;



-- Q13. ROUND() + ABS()
-- Display the product_name and the absolute difference between price and discount, rounded to 1 decimal place.

select product_name, round(abs(price - discount),1)  from products;



-- Q14. POWER() + ROUND()
-- Display the product_name, quantity, and the square of the quantity rounded to 1 decimal place.

select product_name, quantity, round(power(quantity,2),1) from products;



-- Q15. Multiple Mathematical Functions
-- Display the product_name, price, quantity, and the following calculated columns:

-- Price rounded to 1 decimal place
-- Absolute value of the discount
-- Square of the quantity


select product_name, price, quantity, round(price,1), abs(discount), power(quantity,2) from products;

