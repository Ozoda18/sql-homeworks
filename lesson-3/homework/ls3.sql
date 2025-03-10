---Easy-level task---
--BULK INSERT is a command in SQL Server that allows users to efficiently import large volumes of data from a file into a database table.It is much faster than inserting rows individually using INSERT INTO because it minimizes logging and optimizes data transfer.

CREATE TABLE Products(
Pro_id INT PRIMARY KEY,
Pro_name VARCHAR(50),
Price DECIMAL(10,2)
);
INSERT INTO Products VALUES 
(1,'Laptop',1200),
(2,'Smartphone',800),
(3,'Headphones',120);
SELECT * FROM Products;
---Difference between NULL and NOT NULL: In SQL, Null represents the absence of a value, whereas NOT NULL ensures that a column must always have a value.A NULL value in SQL means that the field contains no value(not even an empty string or zero).NOT NULL ensures that a column cannot have NULL values. Every row must contain a valid value for columns with NOT NULL.
ALTER TABLE Products
ADD CONSTRAINT Pro_name UNIQUE;
CREATE TABLE Categories(
Cat_id INT PRIMARY KEY,
Cat_name VARCHAR(50) UNIQUE,
[Desc] VARCHAR(50)
);
SELECT * FROM Categories;
--Purpose of the Identity column in SQL is used to automatically generate unique numeric values for a table's primary key. It eliminates the need for manual input and ensures that each row gets a unique identifier.Key feautures of Identity is auto-incrementing,unique values,improves performance,no need for explicit insertion.
---Medium-level task---
BULK INSERT Products
FROM 'C:\Users\HP\OneDrive\pro.csv'
WITH(
FIELDTERMINATOR=',',
ROWTERMINATOR='\n',
FIRSTROW=2
);
CREATE TABLE Sales(
ID INT PRIMARY KEY,
Name VARCHAR(50),
Price DECIMAL(10,2),
Category VARCHAR(50)
);
SELECT * FROM Sales;
CREATE TABLE Category(
Cat_id INT PRIMARY KEY,
Name VARCHAR(50),
Price DECIMAL(10,2)
);
CREATE TABLE Productss(
Pro_id INT PRIMARY KEY,
Name VARCHAR(50),
Price DECIMAL(10,2),
Type VARCHAR(50)
Cat_id INT
FOREIGN KEY(Cat_id) REFERENCES Category(Cat_id) 
);
--Difference between PRIMARY KEY and UNIQUE KEY: Both PRIMARY KEY and UNIQUE KEY constraints enforce uniqueness in a column, but they have differences in behavior and usage.Primary key ensures uniqueness and does not allow NULL values. A table can have only one PRIMARY KEY.UNIQUE KEY ensures uniqueness but allows a single NULL value. A table can have multiple UNIQUE KEY constraints.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK(Price>0);
SELECT * FROM Products;
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

--A FOREIGN KEY constraint is used to enforce referential integrity between two tables.It ensures that values in a column in one table match values in another table's PRIMARY KEY column.Purpose of FOREIGN KEY :maintaining data integrity,ensures relationships,prevents orphan records,optimizes queries.
---Hard-level task---
CREATE TABLE Customers(
Cus_id INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Age INT CHECK(Age>=18)
);
SELECT * FROM Customers;
CREATE TABLE Customerss(
Cus_id INT IDENTITY(100,10) PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Age INT
);
SELECT * FROM Customerss;
CREATE TABLE Orderdetails(
Order_id INT,
Pro_id INT,
QuantitY INT NOT NULL
PRIMARY KEY(Order_id, Pro_id)
);
SELECT * FROM Orderdetails;
--Both COALESCE and ISNULL are used to replace NULL vakues with a default value,but they have key differences in functionality.ISNULL accepts only two arguments. If the first argument is NULL, it returns the second argument.COALESCE accepts multiple argumemts and returns the first non-null value. Works with more than two arguments,unlike ISNULL.
CREATE TABLE Employeess1(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Phone_number CHAR(10),
Email VARCHAR(100) UNIQUE
);
SELECT * FROM Employeess1;
CREATE TABLE Products1(
Pro_id INT PRIMARY KEY,
Pro_name VARCHAR(50),
Price DECIMAL(10,2)
);
SELECT * FROM Products1;
CREATE TABLE Employee(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Dep VARCHAR(50),
Pro_id INT FOREIGN KEY(Pro_id) REFERENCES Employeess1(Emp_id) ON DELETE CASCADE
);
SELECT * FROM Employee;















