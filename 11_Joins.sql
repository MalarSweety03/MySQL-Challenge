-- MYSQL Challenege - Joins


CREATE DATABASE employees_dbb;

USE employees_dbb ;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    joining_date DATE
);


INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing'),
(105, 'Operations'),
(106, 'Sales');



INSERT INTO employees VALUES
(1, 'Arun', 101, 65000, '2022-01-15'),
(2, 'Priya', 102, 45000, '2022-03-10'),
(3, 'Karthik', 101, 75000, '2021-06-20'),
(4, 'Divya', 103, 55000, '2023-02-12'),
(5, 'Rahul', 104, 40000, '2023-05-18'),
(6, 'Sneha', 102, 50000, '2021-11-25'),
(7, 'Vikram', 103, 60000, '2022-08-05'),
(8, 'Meena', NULL, 38000, '2024-01-10'),
(9, 'Sanjay', 101, 80000, '2020-09-15'),
(10, 'Anitha', 104, 42000, '2023-07-22');


-- Basic JOIN questions
-- Q1. Display employee names along with their department names.

select e.employee_name, d.department_name from employees as e 
inner join departments as d on e.department_id = d.department_id;


-- Q2. Display all employees, including employees who are not assigned to any department.

select e.employee_name, d.department_name from employees as e 
left join departments as d on e.department_id = d.department_id;


-- Q3. Display all departments, including departments that do not have any employees.

select e.employee_name, d.department_name from employees as e 
right join departments as d on e.department_id = d.department_id;


-- Q4. Display employee names, department names, and salaries for employees working in the IT department

select e.employee_name,e.salary, d.department_name from employees as e 
right join departments as d on e.department_id = d.department_id
where d.department_name = "IT";


-- Q5. Find employees who are not assigned to any department.

select e.employee_name, e.employee_id from employees as e 
left join departments as d on e.department_id = d.department_id
where d.department_id is null;




-- Intermediate JOIN questions

-- Q6. Find departments that currently have no employees.

select d.department_id, e.employee_id from departments as d left join employees as e
on e.department_id = d.department_id where e.employee_id is null;


-- Q7. Display the total number of employees in each department, including departments with zero employees.

select count(e.employee_id), d.department_id from employees as e right join departments as d 
on e.department_id = d.department_id group by department_id;


-- Q8. Calculate the average salary for each department and display the department name.

select avg(e.salary), d.department_name from departments as d left join employees as e
on e.department_id = d.department_id group by d.department_name;


-- Q9. Find the highest-paid employee in each department and display their department name.

select e.employee_name, d.department_name from departments as d 
left join employees as e 
on e.department_id = d.department_id 
 where e.salary = (select max(e2.salary) from employees as e2 where d.department_id = e2.department_id);


-- Q10. Display employees whose salary is greater than 50,000 along with their department names.

select e.employee_name, e.salary, d.department_name from employees as e left join
departments as d on e.department_id = d.department_id where e.salary > 50000;



-- Advanced JOIN questions

-- Q11. Find departments where the total number of employees is greater than 2.

select 
    count(e.employee_id), d.department_name 
    from departments as d 
    left join employees as e
     on e.department_id = d.department_id
     group by d.department_name
     having count(e.employee_id) > 2;


-- Q12. Find employees who earn more than the average salary of their department.

select e.employee_name, d.department_name from departments as d 
right join employees as e 
on e.department_id = d.department_id 
 where e.salary > (select avg(e2.salary) from employees as e2
 where d.department_id = e2.department_id);


-- Q13. Display the department name and total salary expenditure for each department, including departments with no employees.

select sum(e.salary), d.department_name from departments as d 
left join employees as e 
on e.department_id = d.department_id group by department_name;
 
 
-- Q14. Find employees who joined after 1 January 2023 and display their department names.

select e.employee_name, d.department_name from employees as e left join departments as d
on d.department_id = e.department_id where e.joining_date > '2023-01-01';


--  Q15. Display all employees and departments, including unmatched records from both tables.

Select e.employee_name, d.department_name from employees as e
left join departments as d on e.department_id = d.department_id 
union 
select  e.employee_name, d.department_name from employees as e
right join departments as d on e.department_id = d.department_id ;
