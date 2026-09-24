


-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

---------------------------------------------------------------------------------------------

                                     -- DISTINCT & AS


-- 1.Display unique product names from the Product table

Select distinct product_name from Product;



-- 2.	Display product names with alias Product_Name.

Select product_name as Product_Name from Product;



-- 3.	Display unique product_id values from the Sales table.

Select distinct product_id from Sales;



-- 4.	Display product price with alias Product_Price.

Select price as Product_Price from Product;

---------------------------------------------------------------------------------------------

             
                                    -- WHERE Clause


-- 5.Display products whose price is greater than 10,000.

Select product_name, price from Product where price > 10000;


-- 6.Show products whose price is less than 5,000.

Select product_name, price from Product where price < 5000;


-- 7.Display sales where quantity equals 2.

Select * from sales where quantity = 2;


-----------------------------------------------------------------------------------------
            
		                         -- Comparison Operators



-- 8.Display products whose price is greater than or equal to 15,000.

select product_name,price from Product where price >= 15000;



-- 9.	Display sales where quantity is not equal to 5.

Select * from sales where quantity <> 5;


------------------------------------------------------------------------------------------------

                                    -- Arithmetic Operators


-- 10.Display product name and price after 10% increase.

select product_name, price, price *1.10 as increased from Product;

-- 11.Display sale amount and sale amount after adding 500.

Select sale_id, sale_amount , sale_amount +500 as salesamountadd500 from sales;


------------------------------------------------------------------------------------------------
                                  
                                  -- Logical Operators


-- 12.Display products whose price is greater than 5,000 AND less than 50,000.

Select product_name, price from Product where price>5000 and price<50000;


-- 13.Display sales where quantity is 2 OR 4.

select * from sales where quantity = 2 or quantity = 4;


-- 14.Display products whose price is NOT greater than 20,000.

select product_name, price from Product where not  price > 20000;


-------------------------------------------------------------------------------------------------

                                      -- IS NULL / IS NOT NULL


-- 15.	Display sales records where product_id is NULL.

select * from sales where product_id is null;


-- 16.	Display products where price is NOT NULL.

select product_name, price from Product where price is not null;


---------------------------------------------------------------------------------------------

                                           -- IN and NOT IN


-- 17.Display products with product_id 1, 3, and 5.

Select product_name, product_id from Product where product_id in (1,3,5);


-- 18.	Display products whose product_id is NOT 2, 4, and 6.

Select product_name, product_id from Product where product_id not in (2,4,6);


----------------------------------------------------------------------------------------------------

                                        -- BETWEEN and NOT BETWEEN


-- 19.Display products whose price is between 1,000 and 20,000.

select product_name, price from Product where price between 1000 and 20000;


-- 20. Display products whose price is NOT between 5,000 and 50,000.

select product_name, price from Product where price not between 5000 and 50000;


--------------------------------------------------------------------------------------------

                                  -- LIKE and NOT LIKE


-- 21.Display products whose name starts with 'M'.

select product_name from product where product_name like 'M%';


-- 22.Display products whose name ends with 'e'.

select product_name from product where product_name like '%e';


-- 23.Display products whose name contains 'phone'.

select product_name from product where product_name like '%phone%';


-- 24.Display products whose name does not start with 'S'.

select product_name from product where product_name not like 'S%';


-----------------------------------------------------------------------------------------------

                                        -- Mixed Questions (Exam Level)


-- 25.Display products whose price is between 1,000 and 20,000 AND product name starts with 'M'.

select * from Product where (price between 1000 and 20000) and (product_name like 'M%');


-- 26.Display sales where quantity is between 2 and 10.

Select * from Sales where quantity between 2 and 10;


-- 27.Display products whose product_id is in (1,2,3) AND price greater than 5,000.

select * from Product where product_id in (1,2,3) and (price >5000);


-- 28.Display unique sale quantities from the Sales table.

Select distinct quantity from Sales;








	

