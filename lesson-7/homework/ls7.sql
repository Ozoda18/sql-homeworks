---Easy-level tasks---
USE AdventureWorks2022;
SELECT DISTINCT 
MIN(ListPrice) as minprice 
FROM Production.Product;
USE example_db;
SELECT DISTINCT 
MAX(Salary) as maxsalary
FROM Employeeess1;
USE example;
SELECT DISTINCT
COUNT(*) AS total
FROM Customers;
SELECT DISTINCT
COUNT(DISTINCT Pro_name)
from Products;
use example_db
select DISTINCT
SUM(Price) as totalprice 
from Sales;
use example_db;
ALTER TABLE Employeess3
ALTER COLUMN Age INT;
SELECT DISTINCT 
AVG(Age) as avgage
FROM Employeess3;
SELECT Department,
count(*) as emp_count
FROM Employeess3
GROUP BY Department;
select Category,
min(Price) as minprice,
max(Price) as maxprice
from Productss
group by Category;
SELECT Region,
SUM(Price) as total
from Sales
GROUP BY Region;
update Employeees
set Department='IT'
where Emp_id=6;
select * from Employeees
select Department
from Employeees
GROUP BY Department
having count(*)>5;
---Medium-level tasks---
SELECT Category,
SUM(Price) as total,
AVG(Price) as avgprice
from Sales
GROUP BY Category;
SELECT Department,
COUNT(*) as counted
from Employeees
where Department='IT'
group by Department;
SELECT Department, 
max(Salary) as maxprice,
min(Salary) as minprice
from Employeeess1
Group by Department;
SELECT Department,
AVG(Salary) as avgsalary from Employeeess1
group by Department;
SELECT Department,
AVG(Salary) as avgsalary,
count(*) as counted 
from Employeeess1
group by Department;
SELECT Pro_name,
AVG(Price) as avgprice
FROM Products
GROUP BY Pro_name
HAVING AVG(Price)>100;
SELECT COUNT(DISTINCT Pro_id) as countpro
from Productss1
where stock>100;
use AdventureWorks2022;
select SellStartDate,
Sum(ListPrice) as total
from Production.Product
group by SellStartDate;
use example_db;
SELECT * FROM Customers;
SELECT Country,
COUNT(DISTINCT ID) 
FROM Customers
GROUP BY Country;
use example_db;
SELECT Department,
SUM(Salary) as totalsalary
FROM Employeeess1
group by Department
having Sum(Salary)>100000;
---Hard-level tasks---
USE example_db;
SELECT Category,
AVG(Price) as avgprice
FROM Productss
GROUP BY Category
HAVING AVG(Price)>200;
SELECT Emp_name,
sum(Salary) as total
FROM Employeeess1
GROUP BY Emp_name
having SUM(Salary)>5000;
SELECT Department,
SUM(Salary) as total,
AVG(Salary) as avgsalary
from Employeeess1
GROUP BY Department
HAVING AVG(Salary)>6000;
SELECT Pro_name,
MAX(Stock) as maxstock,
MIN(Stock) as minstock
FROM Productss1
GROUP BY Pro_name
HAVING MIN(Stock)<50;
use example_db;
CREATE TABLE Sale(
ID INT,
Product VARCHAR(50),
Category VARCHAR(50),
Price DECIMAL(10,2),
Region VARCHAR(50),
[Order] INT
);
INSERT INTO Sale VALUES
(1,'Laptop','technique',1200,'USA',23),
(2,'Smartphone','technique',600,'China',65),
(3,'Blouse','clothing',13,'Turkey',13),
(4,'Jeans','clothing',19,'Turkey',25);
SELECT * FROM Sale;
SELECT Region,
SUM(Price) as total,
COUNT(DISTINCT [Order] ) as [unique]
FROM Sale
GROUP BY Region
HAVING COUNT(DISTINCT [Order] )>10;
SELECT Product,Category,
MAX([Order]) as maxorder,
min([Order]) as minorder
FROM Sale
GROUP BY Product,Category;
create table Sales(
SaleID INT PRIMARY KEY,
Region varchar(50),
Year int,
Q1 decimal(10,2),
Q2 decimal(10,2),
Q3 decimal(10,2),
Q4 decimal(10,2)
);
insert into Sales values
(1,'north',2023,5000,6000,7000,8000),
(2,'South', 2023, 4000, 5000, 6000, 7000),
(3,'East', 2023, 3000, 4000, 5000, 6000),
(4,'West', 2023, 2000, 3000, 4000, 5000),
(5,'North', 2022, 4500, 5500, 6500, 7500),
(6,'South', 2022, 3500, 4500, 5500, 6500);
select * from Sales;
create table Sale(
SaleID INT PRIMARY KEY,
Region varchar(50),
Year int,
Sales_amount decimal(10,2)
);
insert into Sale values
(1,'North', 2021, 50000),
(2,'North', 2022, 60000),
(3,'North', 2023, 70000),
(4,'South', 2021, 40000),
(5,'South', 2022, 55000),
(6,'South', 2023, 65000),
(7,'East', 2021, 30000),
(8,'East', 2022, 42000),
(9,'East', 2023, 50000),
(10,'West', 2021, 20000),
(11,'West', 2022, 35000),
(12,'West', 2023, 45000);
SELECT Region,
SUM(CASE WHEN [Year]=2021 then Sales_amount else 0 end) as 2021sales,
SUM(CASE WHEN [Year]=2022 then Sales_amount else 0 end) as 2022sales,
SUM(CASE WHEN [Year]=2023 then Sales_amount else 0 end) as 2023sales
from Sale
group by Region;
SELECT 'Q1' AS Quarter, SUM(Q1) AS TotalSales FROM Sales
UNION ALL
SELECT 'Q2', SUM(Q2) FROM Sales
UNION ALL
SELECT 'Q3', SUM(Q3) FROM Sales
UNION ALL
SELECT 'Q4', SUM(Q4) FROM Sales;
use example_db;
select [Product],Category,
count([Order]) as counted
from Sale
group by Product,Category
having count([Order])>50;
use AdventureWorks2022
select SaleID,
SUM(Q1) AS Q1sale,
SUM(Q2) AS Q2sale,
SUM(Q3) AS Q3sale,
SUM(Q4) AS Q4sale
from Sales
group by SaleID;















select Region,
SUM(Price) as total,
COUNT(DISTINCT Name) 
from Sales
GROUP BY Region
HAVING 
;


















select * from Productss1
















 

