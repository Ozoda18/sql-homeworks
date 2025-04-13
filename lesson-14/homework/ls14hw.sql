--Easy-level tasks--
create database l14;
use l14;
CREATE TABLE Employees ( 
EmployeeID INT PRIMARY KEY,
DepartmentID INT, 
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10, 2) 
);
INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES 
(1, 1, 'John', 'Doe', 60000.00), 
(2, 1, 'Jane', 'Smith', 65000.00), 
(3, 2, 'James', 'Brown', 70000.00), 
(4, 3, 'Mary', 'Johnson', 75000.00), 
(5, 4, 'Linda', 'Williams', 80000.00), 
(6, 2, 'Michael', 'Jones', 85000.00), 
(7, 1, 'Robert', 'Miller', 55000.00), 
(8, 3, 'Patricia', 'Davis', 72000.00), 
(9, 4, 'Jennifer', 'García', 77000.00), 
(10, 1, 'William', 'Martínez', 69000.00);
CREATE TABLE Sales (
SalesID INT PRIMARY KEY,
EmployeeID INT,
ProductID INT, 
SalesAmount DECIMAL(10, 2), 
SaleDate DATE 
);

INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES 
(1, 1, 1, 1500.00, '2025-01-01'),
(2, 2, 2, 2000.00, '2025-01-02'), 
(3, 3, 3, 1200.00, '2025-01-03'), 
(4, 4, 4, 1800.00, '2025-01-04'), 
(5, 5, 5, 2200.00, '2025-01-05'), 
(6, 6, 6, 1400.00, '2025-01-06'), 
(7, 7, 1, 2500.00, '2025-01-07'), 
(8, 8, 2, 1700.00, '2025-01-08'), 
(9, 9, 3, 1600.00, '2025-01-09'), 
(10, 10, 4, 1900.00, '2025-01-10'), 
(11, 1, 5, 2100.00, '2025-01-11'), 
(12, 2, 6, 1300.00, '2025-01-12'), 
(13, 3, 1, 2000.00, '2025-01-13'), 
(14, 4, 2, 1800.00, '2025-01-14'), 
(15, 5, 3, 1500.00, '2025-01-15'), 
(16, 6, 4, 2200.00, '2025-01-16'), 
(17, 7, 5, 1700.00, '2025-01-17'), 
(18, 8, 6, 1600.00, '2025-01-18'), 
(19, 9, 1, 2500.00, '2025-01-19'),
(20, 10, 2, 1800.00, '2025-01-20'), 
(21, 1, 3, 1400.00, '2025-01-21'), 
(22, 2, 4, 1900.00, '2025-01-22'), 
(23, 3, 5, 2100.00, '2025-01-23'), 
(24, 4, 6, 1600.00, '2025-01-24'), 
(25, 5, 1, 1500.00, '2025-01-25'), 
(26, 6, 2, 2000.00, '2025-01-26'), 
(27, 7, 3, 2200.00, '2025-01-27'), 
(28, 8, 4, 1300.00, '2025-01-28'), 
(29, 9, 5, 2500.00, '2025-01-29'), 
(30, 10, 6, 1800.00, '2025-01-30'), 
(31, 1, 1, 2100.00, '2025-02-01'), 
(32, 2, 2, 1700.00, '2025-02-02'), 
(33, 3, 3, 1600.00, '2025-02-03'), 
(34, 4, 4, 1900.00, '2025-02-04'), 
(35, 5, 5, 2000.00, '2025-02-05'), 
(36, 6, 6, 2200.00, '2025-02-06'), 
(37, 7, 1, 2300.00, '2025-02-07'), 
(38, 8, 2, 1750.00, '2025-02-08'), 
(39, 9, 3, 1650.00, '2025-02-09'), 
(40, 10, 4, 1950.00, '2025-02-10');
CREATE TABLE Products ( 
ProductID INT PRIMARY KEY,
CategoryID INT, 
ProductName VARCHAR(100),
Price DECIMAL(10, 2) 
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES 
(1, 1, 'Laptop', 1000.00), 
(2, 1, 'Smartphone', 800.00), 
(3, 2, 'Tablet', 500.00), 
(4, 2, 'Monitor', 300.00), 
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00), 
(8, 4, 'Speaker', 200.00), 
(9, 5, 'Smartwatch', 250.00), 
(10, 5, 'Camera', 700.00);
CREATE TABLE Numbers (
Id INTEGER,
StepNumber INTEGER,
[Count] INTEGER ); 
INSERT INTO Numbers VALUES
(1,1,1) ,
(1,2,-2) ,
(1,3,-1) ,
(1,4,12) ,
(1,5,-2) ,
(2,1,7) ,
(2,2,-3); 
CREATE TABLE Schedule (
ScheduleID CHAR(1) PRIMARY KEY,
StartTime DATETIME NOT NULL, 
EndTime DATETIME NOT NULL );
INSERT INTO Schedule (ScheduleID, StartTime, EndTime) VALUES 
('A',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 15:00:00' AS DATETIME)), 
('B',CAST('2021-10-01 10:15:00' AS DATETIME),CAST('2021-10-01 12:15:00' AS DATETIME)); 
CREATE TABLE Activity ( 
ScheduleID CHAR(1) REFERENCES Schedule (ScheduleID),
ActivityName VARCHAR(100),
StartTime DATETIME, 
EndTime DATETIME, 
PRIMARY KEY (ScheduleID, ActivityName, StartTime, EndTime) ); 
INSERT INTO Activity (ScheduleID, ActivityName, StartTime, EndTime) VALUES
('A','Meeting',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 10:30:00' AS DATETIME)),
('A','Break',CAST('2021-10-01 12:00:00' AS DATETIME),CAST('2021-10-01 12:30:00' AS DATETIME)), 
('A','Meeting',CAST('2021-10-01 13:00:00' AS DATETIME),CAST('2021-10-01 13:30:00' AS DATETIME)), 
('B','Break',CAST('2021-10-01 11:00:00'AS DATETIME),CAST('2021-10-01 11:15:00' AS DATETIME));
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) );

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'), 
(4, 'Finance'), 
(5, 'IT'), 
(6, 'Operations'),
(7, 'Customer Service'), 
(8, 'R&D'), 
(9, 'Legal'), 
(10, 'Logistics');
--------------------------------------------------
1.with numbers as(
select 1 as n
union all
select n+3 as n
from numbers
where n<20)
select * from numbers;
2.with numbers as(
select 1 as n
union all
select n*2 as n
from numbers
where n<20)
select * from numbers;
3. select *
from employees e
join(
select employeeID, sum(salary) as totalSalary
from Employees
group by EmployeeID
) s
on e.EmployeeID=s.EmployeeID;
4.WITH AverageSalaryCTE AS (
    SELECT AVG(salary) AS average_salary
    FROM Employees
)
SELECT average_salary
FROM AverageSalaryCTE;
5.SELECT 
    p.ProductName,
    s_max.ProductID,
    s_max.max_amount AS highest_sale
FROM (
    SELECT 
        ProductID,
        MAX(SalesAmount) AS max_amount
    FROM Sales
    GROUP BY ProductID
) AS s_max
JOIN Products p 
ON s_max.productId = p.ProductID;
6.with cte as(
select e.EmployeeID,COUNT(*) as counted
from  Employees e
join Sales s
on s.EmployeeID=e.EmployeeID
group by e.EmployeeID
)
select * from cte
where counted>5;
7.with cte1 as (
select s.*,p.productname 
from sales s
join Products p 
on s.productID = p.ProductID 
)
select productname, salesAmount from cte1
where salesAmount > 500;
8.with cte1 as (
select AVG(Salary) as Average from Employees
)
select * from Employees
where Salary > (select * from cte1)
 9.select * 
 from(
 select s.productID, sum(salesamount) as total
 from sales s
 join Products p
 on p.ProductID=s.productID
 group by s.ProductID
 ) tb1;
 10.WITH cte AS (
 SELECT DISTINCT Employeeid
 FROM Sales
)
SELECT e.FirstName
FROM Employees e
 JOIN cte sm 
 ON e.employeeid = sm.employeeid
WHERE sm.employeeid IS NULL;
select * from Employees;
 --Medium-level tasks--
 1.with factorial as(
 select 1 as n, 1 as fac1
 union all
 select n+1,fac1*(n+1)
 from factorial
 where n<10)
 select * from factorial;
 2.with fibonacci as(
 select 1 as step,0 as fib1,1 as fib2
 union all
 select step+1,fib2,fib1+fib2
 from fibonacci 
 where step<10)
 select * from fibonacci;
3.declare @input varchar
set @input='example'
WITH cte AS (
SELECT 1 AS pos, SUBSTRING('@input', 1, 1) AS part
  UNION ALL
 SELECT pos + 1, SUBSTRING( '@input', 1, pos + 1)
   FROM cte
   WHERE pos < LEN('Example')
)
SELECT * FROM cte;
4.with cte as(
select e.EmployeeID,e.FirstName, e.LastName, Sum(s.salesamount) as total
from Employees e
join sales s 
on s.EmployeeID=e.EmployeeID
group by e.EmployeeID,e.FirstName, e.LastName)
select * from cte
order by total desc;
5.select top 5 e.EmployeeID,e.FirstName,e.LastName from Employees e
join(
select EmployeeID,count(salesamount) as numberOForders
from sales 
group by EmployeeID
) s
on e.EmployeeID=s.EmployeeID
order by numberOForders desc;
7.select * 
from sales;
select * from Products
select p.CategoryID,p.ProductName,s.total  from 
Products p
join (
select ProductID, sum(SalesAmount) as total
from sales 
group by ProductID) s
on s.ProductID=p.productID
group by p.CategoryID,p.ProductName,s.total;
8.with cte as(
select p.ProductName,sum(s.salesamount) as total
from Products p
join sales s 
on p.ProductID=s.ProductID
group by p.ProductName)
select * from cte
order by total desc;
9.select e.EmployeeID,e.FirstName,s.total  from 
employees e
join (
select EmployeeID, sum(SalesAmount) as total
from sales 
group by EmployeeID) s
on s.EmployeeID=e.EmployeeID
where total>5000;
10.select top 3 e.EmployeeID,e.FirstName,s.total  from 
employees e
join (
select EmployeeID, sum(SalesAmount) as total
from sales 
group by EmployeeID) s
on s.EmployeeID=e.EmployeeID
order by total desc;
--Hard-level tasks--
1.WITH NumbersCTE AS (
    SELECT 1 AS i, CAST(1 AS VARCHAR(MAX)) AS num_sequence
    UNION ALL
    SELECT i + 1, num_sequence + CAST(i + 1 AS VARCHAR)
    FROM NumbersCTE
    WHERE i < 5  -- Change 5 to your desired n
)
SELECT num_sequence FROM NumbersCTE;
2.select e.EmployeeID,e.FirstName,s.total  from 
employees e
join (
select EmployeeID, sum(SalesAmount) as total
from sales 
where SaleDate=DATEADD(MONTH, -6, GETDATE())
group by EmployeeID) s
on s.EmployeeID=e.EmployeeID
order by total desc;
3.select * from Numbers;
WITH RunningTotal AS (
SELECT id,[count],GREATEST(0, LEAST(10,[count])) AS total
FROM Numbers 
WHERE id = 1
UNION ALl
SELECT n.id,n.[count],GREATEST(0, LEAST(10, rt.total + n.[count])) AS total
 FROM RunningTotal rt
JOIN Numbers n
ON n.id = rt.id + 1
)
SELECT * FROM RunningTotal;
4.select * from Schedule;
select * from Activity
SELECT
    COALESCE(a.start_time, s.start_time) AS start_time,
    COALESCE(a.end_time, s.end_time) AS end_time,
    COALESCE(a.activity_name, 'Work') AS activity
FROM Schedule s
LEFT JOIN Activity a
    ON s.ScheduleID= a.ScheduleID
    AND a.starttime >= s.starttime
    AND a.endtime <= s.endtime
ORDER BY s.employee_id, start_time;
