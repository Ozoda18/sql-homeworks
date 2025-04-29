1.CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');
select *,
right( '0'+cast(month(Dt) as varchar),2) as MonthPreFixedWithZero
from Dates;
2.CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);
select * from MyTabel;
select count(distinct id),
rid,
sum(MaxVals) as total from
(select id,rid,
max(vals) as MaxVals
from MyTabel
group by Id,rid) as maxpergroup
group by rid;
3.CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');
select * from TestFixLengths
select * 
from TestFixLengths
where len(vals)>=6 and len(vals)<=10;
4.CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);
SELECT ID, Item, Vals
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ID ORDER BY Vals DESC) AS rn
    FROM TestMaximum
) AS ranked
WHERE rn = 1;
5.CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);
select * from SumOfMax;
SELECT 
    Id, 
    SUM(MaxVal) AS SumofMax
FROM (
    SELECT 
        Id, 
        DetailedNumber, 
        MAX(Vals) AS MaxVal
    FROM 
        SumOfMax
    GROUP BY 
        Id, DetailedNumber
) AS MaxPerGroup
GROUP BY 
    Id;
6.CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);
select *,
case when a-b<>0 then cast(a-b as varchar) else ' ' end as differences
from TheZeroPuzzle;
7.~ CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50)
);
INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North'),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North'),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East'),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West'),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South'),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South'),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East'),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North'),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West'),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East'),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South'),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North'),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West'),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South'),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East'),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North'),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South'),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East'),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West'),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North');
select * from sales;
select sum(quantitySold*unitprice) as total
from Sales;
8.select avg(unitprice)  as avg_price
from Sales;
9.select count(*)
from Sales;
10.select max(total)
from(select sum(quantitysold) as total
from sales
group by category) a
11.select category,sum(quantitysold) as total
from sales
group by category;
12.select region,sum(QuantitySold*UnitPrice) as forRegion
from Sales
group by Region;
13.select sum(quantitysold)
from sales;
14.select top 1 product, sum(QuantitySold*UnitPrice) as total
from sales
group by product
order by total desc;
15.select *,
sum(QuantitySold*UnitPrice) over(order by saledate) as running
from sales
order by saledate;
16.select category,
sum(QuantitySold*UnitPrice) as contribution
from sales
group by category;
 CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');
select * from Customers;
select * from sales;
17.select s.product,
c.CustomerName
from Customers c
join sales s
on c.Region=s.Region;
18.SELECT 
    c.customerid,
    c.customername
FROM 
    customers c
left JOIN 
    sales s ON c.Region = s.Region
WHERE 
    s.saleid IS NULL;
19.SELECT 
    c.customerid,
    c.customername,
    SUM(s.unitprice * s.quantitysold) AS total_revenue
FROM 
    customers c
JOIN 
    sales s ON c.region = s.Region
GROUP BY 
    c.customerid, c.customername
ORDER BY 
    total_revenue DESC;
20.SELECT top 1 
    c.customerid,
    c.customername,
    SUM(s.unitprice * s.quantitysold) AS total_revenue
FROM 
    customers c
JOIN 
    sales s ON c.region = s.Region
GROUP BY 
    c.customerid, c.customername
ORDER BY 
    total_revenue DESC;
21.SELECT 
    c.customerid,
    c.customername,
    SUM(s.unitprice * s.quantitysold) AS total_revenue
FROM 
    customers c
JOIN 
    sales s ON c.region = s.Region
GROUP BY 
    c.customerid, c.customername
ORDER BY 
    total_revenue DESC;
 drop table products CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);
SELECT DISTINCT
    p.productid,
    p.productname
FROM 
    products p
JOIN 
    sales s ON p.productid = s.productid
WHERE 
    s.quantitysold > 0;
23.select top 1 productName,
costprice
from products p
order by costprice desc;
24.SELECT 
    s.sale_id,
    s.product_id,
    s.quantity_sold,
    s.sale_date,
    p.product_name,
    p.price AS cost_price,  
    s.quantity_sold * p.price AS total_cost
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
ORDER BY 
    s.sale_date;
25.select *
from products p
join (select avg(price) avgs
from products
group by category_id) avg_pri
on p.Categoryid=avg_pri.category_id
where p.price>avg_pri.avgs
order by p.Categoryid,p.price desc;