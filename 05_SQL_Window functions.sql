-- MYSQL Challenege - Window Functions

Create database employees_database;

use employees_database;


CREATE TABLE employee_sales (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    sales_amount INT
);




INSERT INTO employee_sales
(employee_id, employee_name, department, salary, sales_amount)
VALUES
(101, 'Arun', 'IT', 55000, 45000),
(102, 'Priya', 'IT', 65000, 60000),
(103, 'Rahul', 'HR', 48000, 30000),
(104, 'Meena', 'HR', 52000, 42000),
(105, 'Karthik', 'Sales', 58000, 75000),
(106, 'Divya', 'Sales', 62000, 90000),
(107, 'Vijay', 'IT', 70000, 85000),
(108, 'Anitha', 'Sales', 54000, 65000);



-- Question 1 — RANK()

-- Write a query to display employee_name, salary, and the employee's rank based on salary from highest to lowest.

select employee_name, salary, 
       rank() over(order by salary desc) as employees_rank
       from employee_sales;



-- Question 2 — DENSE_RANK()

-- Display employee_name, sales_amount, and the rank of each employee based on sales_amount from highest to lowest using DENSE_RANK().

select employee_name, sales_amount, 
       dense_rank() over(order by sales_amount desc) as employees_rank
       from employee_sales;



-- Question 3 — ROW_NUMBER()

-- Display employee_name, sales_amount, and a unique row number for each employee based on sales_amount from highest to lowest.

select employee_name, sales_amount, 
       row_number() over(order by sales_amount desc) as row_numbers
       from employee_sales;
       
       
       
-- Question 4 — PARTITION BY + RANK()

-- Display employee_name, department, salary, and rank employees based on salary from highest to lowest within each department.

select employee_name, department, salary, 
               rank() over(partition by department order by salary desc) 
               from employee_sales;
               
               
               
-- Question 5 — PARTITION BY + DENSE_RANK()

-- Display employee_name, department, sales_amount, and rank employees based on sales_amount from highest to lowest within each department using DENSE_RANK().
               
     select employee_name, department, sales_amount, 
               dense_rank()
               over(partition by department order by sales_amount desc)
               as employees_rank
               from employee_sales;          
               
               
               
               
-- Question 6 — LAG()

-- Display employee_name, sales_amount, and the previous employee's sales_amount using the LAG() function. Order by sales_amount from lowest to highest.

select employee_name, sales_amount, 
                  lag(sales_amount) 
				 over(order by sales_amount) as previous_salesamount
                 from employee_sales;
                 
                 
                 
-- Question 7 — LEAD()

-- Display employee_name, sales_amount, and the next employee's sales_amount using the LEAD() function. Order by sales_amount from lowest to highest.

select employee_name, sales_amount,
			lead(sales_amount) over (order by sales_amount) as next_empsales
            from employee_sales;
            
            
            
-- Question 8 — Running Total

-- Display employee_name, sales_amount, and the running total of sales_amount using a window function. Order by sales_amount from lowest to highest.

select employee_name, sales_amount, 
             sum(sales_amount) over(order by sales_amount) as total_salesamount 
             from employee_sales;
             
             
             
-- Question 9 — AVG() OVER()

-- Display employee_name, department, salary, and the average salary of all employees using a window function.

select employee_name, department, salary, 
      avg(salary) over() as avgsalary 
      from employee_sales;
      
      
      
-- Question 10 — AVG() OVER(PARTITION BY)

-- Display employee_name, department, salary, and the average salary of employees in each department using a window function.

select employee_name, department, salary, 
      avg(salary) over(partition by department) as avgsalary 
      from employee_sales;
      
      
      
-- Question 11 — SUM() OVER(PARTITION BY)

-- Display employee_name, department, sales_amount, and the total sales amount of each department using a window function.

select employee_name,department, sales_amount, 
             sum(sales_amount) over(partition by department) as total_salesamount 
             from employee_sales;



-- Question 12 — COUNT() OVER()
-- Display employee_name, department, and the number of employees in each department using a window function.

select employee_name, department, 
           count(*) over(partition by department) as no_of_employees 
           from employee_sales;
           
           
           
-- Question 13 — Running Total with PARTITION BY

-- Display employee_name, department, sales_amount, and the running total of sales within each department, ordered by sales_amount from lowest to highest.

select employee_name, department, sales_amount,
				sum(sales_amount) over(partition by department order by sales_amount) as total_sales
                from employee_sales;



-- Question 14 — LAG() with PARTITION BY

-- Display employee_name, department, sales_amount, and the previous employee's sales amount within each department, ordered by sales_amount from lowest to highest.

select employee_name, department, sales_amount, 
              lag(sales_amount) over (partition by department order by sales_amount) as pre_sales 
              from employee_sales;
              
              
              
-- Question 15 — Mixed Window Function

-- Display employee_name, department, salary, and the salary rank of each employee within their department, along with the average salary of that department.

select employee_name, department, salary,
              rank() over(partition by department order by salary desc),
              avg(salary) over(partition by department) as avgsalary
              from employee_sales;
              
              
              
-- Question 16 — Mixed Window Function Interview Question

-- Display employee_name, department, sales_amount, the sales rank within each department, and the previous employee's sales amount within each department, 
-- ordered by sales amount from highest to lowest.


select employee_name, department, sales_amount, 
       rank() over(partition by department order by sales_amount desc) as salesrank,
       lag(sales_amount) over(partition by department order by sales_amount desc) as pre_sales
       from employee_sales;


