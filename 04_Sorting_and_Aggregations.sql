-- MYSQL Challenege - Sorting and Aggregations


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






-- Question 1: ORDER BY
-- List all products sorted by price descending

select * from Product order by price desc;



-- Question 2: ORDER BY with LIMIT
-- Show the top 3 most expensive products.

select product_name, price from Product order by price desc limit 3;



-- Question 3: Aggregate Functions – Total Sales
-- Find the total sales amount across all sales.

select sum(sale_amount) as Total_sales_amount from Sales;



-- Question 4: Aggregate Functions – Average Price
-- Find the average sale amount from the Sales table.

select avg(sale_amount) as avg_sales_amount from Sales;



-- Question 5: Aggregate Functions – Count & Max/Min
-- Count total number of sales.

select count(*) as total_num_sales from Sales;


-- Find highest and lowest sale amounts.

select max(sale_amount) as Highestsale,
	min(sale_amount) as Lowestsale 
    from Sales;



-- Question 6: GROUP BY – Total Sales per Product
-- Find total sales amount per product.

select product_id, sum(sale_amount) as Totalsales 
from Sales 
group by product_id;



-- Question 7: GROUP BY with HAVING
-- List products whose total sales exceed ₹50,000.

select sum(sale_amount) as total_sales, product_id from Sales 
group by product_id 
having total_sales >50000;




-- Question 8: ORDER BY with GROUP BY
-- Show total sales per product, sorted descending by total sales.

select product_id, sum(sale_amount) as totalsales from sales 
group by product_id 
order by totalsales desc;



-- Question 9: LIMIT with GROUP BY
-- Find the top 3 products by total sales amount.

select product_id,sum(sale_amount) as totalsales from Sales 
group by product_id 
order by totalsales desc limit 3;



-- Question 10: HAVING with Aggregate Condition
-- Show products with total sales > ₹30,000 AND average sale amount > ₹10,000.

select product_id, 
sum(sale_amount) as totalsales, 
avg(sale_amount) as avgsales from Sales
group by product_id
having totalsales > 30000 and
avgsales > 10000;



