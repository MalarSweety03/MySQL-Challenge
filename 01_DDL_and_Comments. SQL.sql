-- MYSQL Challenege - DDL and Comments

-- creating database 

create database hospital_db;

use hospital_db;

-- creating table

create table 
Patient_details(PatientID int, Patient_name varchar(50), Age int, Gender varchar(10), Admission_date date);

-- Adding new column

Alter table Patient_details add Doctor_assigned varchar(50);


-- Modifying the column

Alter table Patient_details modify Patient_name varchar(100);

-- Renaming the table

Rename table Patient_details to Patient_Info;

-- Remove all record

Truncate table Patient_Info;

-- Delete Table

Drop table Patient_Info;




