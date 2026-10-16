-- -- MYSQL  Challenge - subqueries--

create database roster;

use roster;

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT,
    salary INT
);

INSERT INTO employees VALUES
(101, 'Arun', 1, 55000),
(102, 'Priya', 2, 65000),
(103, 'Rahul', 1, 48000),
(104, 'Meena', 3, 52000),
(105, 'Karthik', 2, 58000),
(106, 'Divya', 4, 62000),
(107, 'Vijay', 3, 45000),
(108, 'Anitha', 1, 70000),
(109, 'Suresh', 2, 40000),
(110, 'Nisha', 4, 60000);


CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');




-- Question 1
-- Display the employee name and salary of employees who earn more than the company's average salary.

select employee_name, salary from employees 
          where salary > (select avg(salary) from employees);



-- Question 2
-- Display the employee name and salary of the employee(s) who earn the highest salary in the company.

select employee_name, salary from employees 
          where salary = (select max(salary) from employees);
          
          

-- Question 3          
-- Display the employee name and salary of employees who earn less than the company's average salary.

select employee_name, salary from employees 
          where salary < (select avg(salary) from employees);



-- Question 4
-- Display the employee name and salary of employees who earn the same salary as Priya.

select employee_name, salary from employees 
          where salary = (select salary from employees where employee_name = 'Priya');
          
    
    
-- Question 5
-- Display the employee name and salary of employees who earn more than Priya.

select employee_name, salary from employees
					where salary > (select salary from employees where employee_name = 'Priya');
          
          
          
 -- Question 6         
-- Display the employee name and salary of employees who work in the same department as Arun.

select employee_name, salary from employees
                  where department_id = (select department_id from employees where employee_name = 'Arun');
          
          
          
   -- Question 7         
-- Display the employee name, department ID, and salary of the employee(s) who earn the second-highest distinct salary in the company.

select employee_name, salary, department_id from employees
                 where salary = (select max(salary) from employees 
                 where salary < (select max(salary) from employees));
                 
                 
   
   -- Question 8     
-- Display the employee name and salary of employees who earn more than the lowest salary in the company.

select employee_name, salary from employees
              where salary > (select min(salary) from employees);
              
              
              
  -- Question 9                 
-- Display the employee name and salary of employees who earn the same salary as the highest-paid employee in the IT department.

select employee_name, salary from employees
           where salary = (select max(salary) from employees
           where department_id = 1)
           
           
     
     -- Question 10      
-- Display the employee name, department ID, and salary of employees who earn more than the average salary of the HR department (department_id = 2).


select employee_name, department_id, salary from employees
         where salary > (select avg(salary) from employees
         where department_id = 2);
         
         
         
         
-- Question 11
-- Display the employee name and salary of employees who work in a department that has at least one employee earning more than ₹60,000.

select employee_name, salary from employees
       where department_id in (select department_id from employees 
       where salary > 60000);



-- Question 12
-- Display the employee name and salary of employees who work in the same departments as employees earning less than ₹45,000.

select employee_name, salary from employees 
         where department_id = any (select department_id from employees
        where salary < 45000);



-- Question 12
-- Display the employee name and salary of employees who earn more than all employees in department 3 (Sales).

select employee_name, salary from employees 
           where salary > all (select salary from employees where department_id = 3);




-- Question 13
-- Display the employee name and salary of employees who work in departments that have an average salary greater than ₹55,000.

select employee_name, salary from employees
where department_id in (select department_id from employees group by department_id
having avg(salary) > 55000);




-- Question 14
-- Display the employee name and salary of employees whose salary is greater than at least one employee in department 2 (HR).

select employee_name, salary from employees
where salary > any (select salary from employees where department_id = 2);




-- Question 15
-- Display the employee name, department ID, and salary of employees who earn more than the average salary of their own department.

select employee_name, salary, department_id from employees e1
where salary > (select avg(salary) from employees e2 where e1.department_id = e2.department_id);




-- Question 16
-- Display the employee name, department ID, and salary of employees who earn the highest salary in their own department

select employee_name, salary, department_id from employees e1
where salary = (select max(salary) from employees e2 where e1.department_id = e2.department_id);





-- Question 17
-- Display the employee name, department ID, and salary of employees who earn less than the average salary of their own department.

select employee_name, department_id, salary from employees e1
				where salary < (select avg(salary) from employees e2 where e1.department_id = e2.department_id);
                
                
                
                
       -- Question 18   
-- Display the employee name, department ID, and salary of employees who earn more than the lowest salary in their own department.

select employee_name, department_id, salary from employees e1
				where salary > (select min(salary) from employees e2 where e1.department_id = e2.department_id);
                
                
                
    
    
    -- Question 19
-- Display the employee name, department ID, and salary of employees who earn the same salary as at least one other employee in their own department.

select employee_name, department_id, salary from employees e1
				where salary = any (select salary from employees e2 where e1.employee_id <> e2.employee_id
                and e1.department_id = e2.department_id);
