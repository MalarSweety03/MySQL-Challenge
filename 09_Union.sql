
-- MYSQL  Challenge - Union--

create database employ;

use  employ;

CREATE TABLE current_employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO current_employees
(employee_id, employee_name, department, salary)
VALUES
(101, 'Arun', 'IT', 55000.00),
(102, 'Priya', 'HR', 65000.00),
(103, 'Rahul', 'IT', 48000.00),
(104, 'Meena', 'Sales', 52000.00),
(105, 'Karthik', 'HR', 58000.00),
(106, 'Divya', 'Finance', 62000.00);

CREATE TABLE former_employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO former_employees
(employee_id, employee_name, department, salary)
VALUES
(201, 'Vijay', 'IT', 60000.00),
(202, 'Anitha', 'HR', 57000.00),
(203, 'Arun', 'IT', 55000.00),
(204, 'Suresh', 'Sales', 49000.00),
(205, 'Divya', 'Finance', 62000.00),
(206, 'Nisha', 'Marketing', 53000.00);




-- 	Q1- Display the employee names from both current_employees and former_employees, removing duplicate names.

select employee_name from current_employees
union
select employee_name from former_employees;


-- Q2- Display all employee names from both tables, including duplicates.

select employee_name from current_employees
union all
select employee_name from former_employees;


-- Q3 - Display the employee IDs and employee names from both tables, removing duplicate rows.

select employee_name, employee_id from current_employees
union
select employee_name, employee_id from former_employees;


-- Q4 -  Display the department names from both tables, removing duplicates.

select department from current_employees
union
select department from former_employees;



-- Q5 - Display employee names and departments from both tables, including duplicates.

select employee_name, department from current_employees
union all
select employee_name, department from former_employees;



-- Q6 - Display employee IDs, names, and salaries from both tables, removing duplicate rows.

Select employee_id, employee_name, salary from current_employees 
union
Select employee_id, employee_name, salary from former_employees;



-- Q7- Display employee names from both tables and sort the combined result alphabetically.

select employee_name from current_employees
union
select employee_name from former_employees
order by employee_name;



-- Q8 - Display employees earning more than ₹55,000 from both tables, removing duplicate rows.

select employee_name, salary from current_employees
where salary > 55000
union
select employee_name, salary from former_employees
where salary > 55000;



-- 	Q9 - Display employees from the IT department from both tables, including duplicates.

select employee_name from current_employees 
           where department = 'IT'
union all
select employee_name from former_employees
            where department = 'IT';




-- 	Q10 - Display employee names from both tables, but return only unique names from the combined result.

select employee_name from current_employees
union
select employee_name from former_employees;




-- 	Q11 - Combine employee names and departments from both tables, then sort by department and employee name.

select employee_name, department from current_employees
union
select employee_name, department from former_employees
order by department, employee_name;



-- Q12 - Combine the current and former employee records, retaining duplicate rows, and display the result ordered by salary from highest to lowest.

select employee_id, department, employee_name,salary from current_employees
union all
select employee_id, department, employee_name, salary from former_employees
order by salary desc;



-- 	Q13 - Display unique department names from both tables, sorted alphabetically.

select department from current_employees 
union
select department from former_employees
order by department;



-- Q14 - Combine employees from both tables whose salary is between ₹50,000 and ₹60,000, removing duplicate rows.

select employee_id, department, employee_name,salary from current_employees
              where salary between 50000 and 60000
union 
select employee_id, department, employee_name, salary from former_employees
          where salary between 50000 and 60000;




-- Q15 -Combine employee IDs, names, departments, and salaries from both tables, retaining duplicates, and display the top five rows by salary.

select employee_id, employee_name, department, salary from current_employees
union all
select employee_id, employee_name, department, salary from former_employees
order by salary desc limit 5;

