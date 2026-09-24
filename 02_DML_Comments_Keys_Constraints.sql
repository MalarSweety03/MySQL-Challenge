-- MYSQL Challenege - DML and Comments and Key and Constraints

-- Creating Database

Create database Onlinebookstore_db;

Use Onlinebookstore_db;

-- Creating table books

Create table Books(BookID int primary key, 
				Title varchar(100) not null, 
                Author varchaR(50) not null,
                ISBN varchar(20) unique,
                Price Decimal(8,2) check(price>0));
                
                
-- Creating table Orders
     
create table orders(OrderID int primary key,
                         BookID int,
                         Orderdate date not null,
                         Quantity int check (Quantity>0),
	       foreign key (BookID) references books(BookID) 
		   on delete cascade on update cascade);
           
           
           -- Adding default constraints
           
Alter table Books alter column ISBN set default 'Unknown';
           
	-- Inserting Data in Books Table
           
Insert into Books(BookID, Title, Author, ISBN, Price)
					values(1, 'SQL Basics', 'John Smith', 'ISBN001', 450.00),
                          (2, 'Python Basics', 'Sarah Lee', 'ISBN002', 500.00),
                          (3, 'Data Analytics', 'David Brown', 'ISBN003', 650.00),
                          (4, 'Power BI Guide', 'Emma Wilson', 'ISBN004', 550.00),
						  (5, 'Advanced SQL', 'Michael Davis', 'ISBN005', 700.00);
						  
           
    -- Inserting data in Orders Table       
           
Insert into Orders(OrderID, BookID, Orderdate, Quantity) 
               Values(101, 1, '2026-09-01', 2),
					 (102, 2, '2026-09-03', 1),
                     (103, 3, '2026-09-05', 3),
                     (104, 4, '2026-09-08', 2),
					(105, 5, '2026-09-10', 1);  

           
-- Retrieving all coulumns in both table 
           
           Select * From Books;
           Select * From Orders;
        
           
    -- Update the price for a specific book

    
    update books set Price = 600.00 where BookID =4;
    
    
    -- Update the quantity for a specific order while maintaining the CHECK constraint
    
    update Orders set Quantity = 2 where OrderID =102;
    
    
    -- -- Deleting a specific order from the Orders table using the OrderID
 
    
     Delete from Orders where OrderID = 105;
     
     -- Remove all rows from the Orders table while keeping the table structure intact
     
     Truncate table Orders;
     
     
     
     
     
           
           
           
                         