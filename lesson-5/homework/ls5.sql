----Easy-level task----
USE example;
SELECT Pro_name AS Name FROM Products;
SELECT * FROM Customers AS Client;
SELECT * FROM Products;
Drop table Products_Discontinued;

CREATE TABLE Products_Discontinued(
Pro_id INT,
Pro_name VARCHAR(50)
);
INSERT INTO Products_Discontinued VALUES
(1,'Computer'),
(2,'Jeans'),
(3,'Bags'),
(4,'Laptop')
SELECT * FROM Products_Discontinued
SELECT Pro_name FROM Products
UNION
SELECT Pro_name FROM Products_Discontinued;
SELECT Pro_name FROM Products
INTERSECT
SELECT Pro_name FROM Products_Discontinued;
CREATE TABLE Orders(
Pro_id INT,
Pro_name VARCHAR(50),
Price DECIMAL(10,2),
Stock INT
);
INSERT INTO Orders VALUES
(1,'Laptop',1300,4),
(2,'Blouses',120,7),
(3,'Skirt',140,3),
(4,'Computer',1400,9)
SELECT * FROM Products
UNION ALL
SELECT * FROM Orders
CREATE TABLE Customeerss(
Cus_name VARCHAR(50),
Country VARCHAR(50),
Age INT
);
INSERT INTO Customeerss VALUES
('John', 'USA',21),
('Pippa','Japan',34),
('Kamola','Uzbekistan',31),
('John','Canada',62),
('Pippa','Korea',22)
SEleCT DISTINCT Cus_name,Country FROM Customeerss
SELECT Pro_name,Price, 
CASE
WHEN Price>1000 THEN 'High'
ELSE 'Low' END AS Category
FROM Products;
CREATE TABLE Employeees(
Emp_id INT,
Emp_name VARCHAR(50),
Department VARCHAR(50),
Country VARCHAR(50),
Email VARCHAR(100)
);
INSERT INTO Employeees VALUES
(1,'John','HR','Canada','john@gmail.com'),
(2,'Doe','IT','South Korea','doe@gmail.com'),
(3,'Smith','Sales','Japan','smith@gmail.com'),
(4,'Alivia','Marketing','Brazil','alivia@gmail.com'),
(5,'Ken','Research','Mexico','ken@gmail.com'),
(6,'Terri','Manufacturing','Sweden','terri@gmail.com'),
(7,'Roberto','HR','Switzerland','roberto@gmail.com'),
(8,'Rob','Sales','Turkey','rob@gmail.com'),
(9,'Gail','IT','North Korea','gail@gmail.com'),
(10,'Dylan','Marketing','Canada','dylan@gmail.com'),
(11,'Gigi','Research','South Korea','gigi@gmail.com'),
(12,'Michael','Manufacturing','Japan','michael@gmail.com'),
(13,'Janice','HR','Brazil','janice@gmail.com'),
(14,'David','IT','Mexico','david@gmail.com'),
(15,'Kevin','Sales','Sweden','kevin@gmail.com'),
(16,'Jo','Research','Switzerland','jo2gmail.com'),
(17,'Mark','IT','Turkey','mark@gmail.com'),
(18,'Lucy','Marketing','North Korea','lucy@gmail.com')
SELECT * FROM Employeees;
SELECT Country,COUNT(*) FROM Employeees
WHERE Department='Sales'
GROUP BY Country;
USE AdventureWorks2022
select * from Person.Person
SELECT EmailPromotion, COUNT(*) AS Counted FROM Person.Person
GROUP BY EmailPromotion;
create table Products(
ID INT,
Name VARCHAR(50),
Price DECIMAL(10,2),
Stock INT
);
INSERT INTO Products VALUES
(1,'Headphones',90,120),
(2,'Laptop',80,900),
(3,'Computer',1300,76),
(4,'Smartphones',600,265),
(5,'Monitor',300,85)
SELECT * FROM Products
SELECT Name,Stock,
IIF(Stock>100,'enough','not enough') as instock
FROM Products;
---Medium-level task---
CREATE TABLE OutOfStock(
ID INT,
Name VARCHAR(50),
Price DECIMAL(10,2)
);
INSERT INTO OutOfStock VALUES
(1,'Monitor',800),
(2,'Laptop',6),
(3,'Smartphone',300),
(4,'Headphone',15)
SELECT Name from Products
UNION
SELECT Name from OutOfStock;
SELECT * FROM Products
CREATE TABLE DiscontinuedProducts(
Pro_id INT,
Pro_name VARCHAR(50),
Price DECIMAL(10,2)
);
INSERT   INTO DiscontinuedProducts VALUES
(1,'latop',700),
(2,'smartphone',500),
(3,'monitor',200),
(4,'headphone',15)
SELECT Price from Products
EXCEPT 
SELECT Price from DiscontinuedProducts;
CREATE TABLE Customers(
ID INT,
Name VARCHAR(50),
Country VARCHAR(50),
[Order] INT
);
INSERT INTO Customers VALUES
(1,'John','USA',12),
(2,'Doe','Japan',8),
(3,'Smith','North Korea',4),
(4,'Pippa','Turkey',2),
(5,'Lucy','Canada',9),
(6,'Anna','Mexico',21)
SELECT ID,Name,
CASE 
WHEN [Order]>5 THEN 'eligible'
ELSE 'not eligible' END AS Status 
FROM Customers;
SELECT Pro_name,
Price,
IIF(Price>500,'expensive','affordable') as category
FROM Products;
SELECT * FROM Customers
SELECT ID,
COUNT([Order]) as OrderCount
FROM Customers
GROUP BY ID;
CREATE TABLE Employees(
ID INT,
Name VARCHAR(50),
Age INT,
Salary DECIMAL(10,2),
Email VARCHAR(100)
);
INSERT INTO Employees VALUES
(1,'Smith',35,4000,'smith@gmail.com'),
(2,'Alivia',20,1500,'alivia@gmail.com'),
(3,'John',41,6500,'john@gmail.com'),
(4,'Anna',19,5400,'anna@gmail.com'),
(5,'David',28,6200,'david@gmail.com')
SELECT * FROM Employees
WHERE Age<25 OR Salary>6000;
CREATE TABLE Sales(
ID INT,
Name VARCHAR(50),
Category VARCHAR(50),
Price DECIMAL(10,2),
Region VARCHAR(50)
);
INSERT INTO Sales VALUES
(1,'jeans','clothing',15,'china'),
(2,'phones','technique',400,'South Korea'),
(3,'skirt','clothing',17,'Turkey'),
(4,'laptop','technique',600,'Italy'),
(5,'fridge','technique',900,'Spain')
SELECT Region,
SUM(Price) as Totalsales
FROM Sales
GROUP BY Region;
DROP TABLE Employeess
CREATE TABLE Employeeess1(
Emp_id INT,
Emp_name VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
Email VARCHAR(100)
);
INSERT INTO Employeeess1 VALUES
(1,'John','HR',700,'john@gmail.com'),
(2,'Doe','IT',1200,'doe@gmail.com'),
(3,'Smith','Sales',950,'smith@gmail.com'),
(4,'Alivia','Marketing',450,'alivia@gmail.com'),
(5,'Ken','Research',800,'ken@gmail.com'),
(6,'Terri','Manufacturing',600,'terri@gmail.com'),
(7,'Roberto','HR',550,'roberto@gmail.com'),
(8,'Rob','Sales',380,'rob@gmail.com'),
(9,'Gail','IT',810,'gail@gmail.com'),
(10,'Dylan','Marketing',780,'dylan@gmail.com'),
(11,'Gigi','Research',630,'gigi@gmail.com'),
(12,'Michael','Manufacturing',490,'michael@gmail.com'),
(13,'Janice','HR',565,'janice@gmail.com'),
(14,'David','IT',780,'david@gmail.com'),
(15,'Kevin','Sales',754,'kevin@gmail.com'),
(16,'Jo','Research',581,'jo2gmail.com'),
(17,'Mark','IT',745,'mark@gmail.com'),
(18,'Lucy','Marketing',430,'lucy@gmail.com')
UPDATE Employeees1
SET Salary=
CASE 
WHEN Department='HR' then Salary*1,10
ELSE Salary END 
---Hard-level task---
SELECT Pro_name from Products
INTERSECT
SELECT Pro_name from DiscontinuedProducts;
SELECT * FROM Sales
SELECT Name,
Price as Totalsales,
CASE 
WHEN Price>500 then 'top tier'
when Price BETWEEN 100 AND 500 THEN 'mid tier'
ELSE 'low tier' end  category
FROM Sales;
CREATE TABLE Orders(
ID INT,
Name VARCHAR(50),
Stock int
);
INSERT INTO Orders VALUES
(1,'Laptop',25),
(2,'smartphone',21),
(3,'monitor',45)
CREATE TABLE Invoices(
ID INT,
Name VARCHAR(50),
Stock INT
);
INSERT INTO Invoices VALUES
(1,'headphone',32),
(2,'smartphone',48),
(3,'computer',18)
SELECT Name FROM Orders
EXCEPT 
SELECT Name FROM Invoices;
USE AdventureWorks2022;
CREATE TABLE Employees(
Emp_id INT,
Emp_name VARCHAR(50),
Department VARCHAR(50),
Region VARCHAR(50),
Email VARCHAR(100),
Pro_id INT,
Sales DECIMAL(10,2)
);
INSERT INTO Employees VALUES
(1,'John','HR','Canada','john@gmail.com',1,200),
(2,'Doe','IT','South Korea','doe@gmail.com',2,430),
(3,'Smith','Sales','Japan','smith@gmail.com',3,650),
(4,'Alivia','Marketing','Brazil','alivia@gmail.com',4,245),
(5,'Ken','Research','Mexico','ken@gmail.com',5,870),
(6,'Terri','Manufacturing','Sweden','terri@gmail.com',6,320),
(7,'Roberto','HR','Switzerland','roberto@gmail.com',7,350),
(8,'Rob','Sales','Turkey','rob@gmail.com',8,420),
(9,'Gail','IT','North Korea','gail@gmail.com',9,210),
(10,'Dylan','Marketing','Canada','dylan@gmail.com',10,430),
(11,'Gigi','Research','South Korea','gigi@gmail.com',11,640),
(12,'Michael','Manufacturing','Japan','michael@gmail.com',12,890),
(13,'Janice','HR','Brazil','janice@gmail.com',13,456),
(14,'David','IT','Mexico','david@gmail.com',14,720),
(15,'Kevin','Sales','Sweden','kevin@gmail.com',15,365),
(16,'Jo','Research','Switzerland','jo2gmail.com',16,900),
(17,'Mark','IT','Turkey','mark@gmail.com',17,425),
(18,'Lucy','Marketing','North Korea','lucy@gmail.com',18,370)
SELECT Emp_id,Pro_id,Region, SUM(Sales) AS Totalsales
FROM Employees
GROUP BY Emp_id,Pro_id,Region;
CREATE TABLE Orders(
ID INT,
Name VARCHAR(50),
Quantity int
);
INSERT INTO Orders VALUES
(1,'Laptop',25),
(2,'smartphone',21),
(3,'monitor',45)
SELECT *,
CASE 
WHEN Quantity>=40 then 20
WHEN Quantity between 20 AND 25 then 10
ELSE 0 end as discount
FROM Orders;
SELECT* FROM  Orders
SELECT Name,Stock,
IIF(Stock>30,'available','out of stock') as status
FROM Orders;
SELECT * FROM Customers
CREATE TABLE VIP_Customers(
ID INT,
Name VARCHAR(50),
Country VARCHAR(50),
[Order] INT
);
SELECT * FROM Customers
EXCEPT
SELECT * FROM VIP_Customers;















