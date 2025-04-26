CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);
INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');
create table Fruits(
[Name] varchar(50), 
Fruit varchar(50));
insert into Fruits values
('Francesko', 'Apple'),
('Francesko', 'Apple'),
('Francesko', 'Apple'), 
('Francesko', 'Orange'),
('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
('Mario', 'Orange');
create table Family(ParentId int, ChildID int);
insert into Family values (1, 2), (2, 3), (3, 4);
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);
INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);
create table #residents(
resid int identity, 
fullname varchar(50),
address varchar(100));
insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22');
CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);
INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
);
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c');
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);
INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);
INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');
----------------------------
1.select CustomerName 
from #Sales s
where exists(select * from #Sales s1
where s.SaleID=s1.SaleID
and SaleDate>= '2024-03-01'
AND SaleDate < '2024-04-01');
2.select top 1 *
from 
(select Product,sum(price*quantity) as total 
from #Sales
group by Product) as revenue
order by total desc;
3.select MAX(price) AS second_highest_amount
FROM #sales
WHERE price < (
    SELECT MAX(price)
    FROM #sales
);
4. select Months, Sum(Quantity) as Total_quantity from(
select *, DATENAME(MONTH, SaleDate) as Months from #Sales) as x
group by Months;
5.select CustomerName
from #Sales s
where exists(select *
from #Sales 
where SaleID=s.SaleID
and product=s.Product);
6.select [Name],
sum(case when fruit='Apple' then 1 else 0 end)  as apple,
sum (case when fruit='Orange' then 1 else 0 end) as orange,
sum (case when fruit='Banana' then 1 else 0 end)  as banana
from Fruits
group by [Name];
7.with cte as (
  select ParentId , ChildID 
  from Family
  union all
  select c.ParentId, f.ChildID from cte c 
  join Family f on c.ChildID = f.ParentId
)
select * from cte
order by ParentId,ChildID
8.select * from #Orders o
where CustomerID in(
select CustomerID
from #Orders
where DeliveryState='CA')and o.DeliveryState='TX';
9.UPDATE #residents
SET address = 
    CASE
        WHEN address NOT LIKE '%name=%' THEN
           
            'city=' + SUBSTRING(address, CHARINDEX('city=', address)+5 , LEN(address)) + ' name=' + fullname
        ELSE
            
            address
    END
WHERE address NOT LIKE '%name=%'
select * from #residents;
10.WITH cte AS (
   SELECT RouteID, DepartureCity, ArrivalCity, Cost, CAST(DepartureCity AS VARCHAR(MAX)) + ' - ' + CAST(ArrivalCity AS VARCHAR(MAX)) AS Path, Cost AS TotalCost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'
    UNION ALL
    SELECT r.RouteID, r.DepartureCity, r.ArrivalCity, r.Cost, 
           rp.Path + ' - ' + CAST(r.ArrivalCity AS VARCHAR(MAX)), 
           rp.TotalCost + r.Cost
    FROM #Routes r
    JOIN cte rp ON r.DepartureCity = rp.ArrivalCity
    WHERE rp.ArrivalCity != 'Khorezm' 
)
SELECT Path, TotalCost
FROM cte
WHERE ArrivalCity = 'Khorezm'
ORDER BY TotalCost;
11.select * ,
row_number()over(order by ID) as ranked
from #RankingPuzzle
where Vals='Product';
13.select * from #EmployeeSales es
where SalesAmount>(select avg(SalesAmount)
from #EmployeeSales
where es.Department=Department);
14.select * from #EmployeeSales e
where exists(select 1 from #EmployeeSales e1
where e.SalesMonth=e1.SalesMonth 
and e1.SalesMonth=(select max(salesamount)
from #EmployeeSales
where SalesMonth=e.SalesMonth)
and e1.EmployeeID=e.EmployeeID);
15.select EmployeeName from #EmployeeSales e
where not exists(select 1 from
(select distinct SalesMonth from #EmployeeSales) as months
where not exists(
select 1 from #EmployeeSales e1
where e1.EmployeeID=e.EmployeeID and e1.SalesMonth=e.SalesMonth));
16.select [Name] from Products
where price>(select avg(price)
from Products);
17.select * from Products
where Stock<(select max(stock) from Products);
18.select * from products 
where category=(select category from Products
where [name]='Laptop');
19.select * from products
where price>(select min(price)from Products
where category='Electronics');
20.select * from products p
where price>(select avg(price) 
from Products
where p.Category=category);
21.select * from orders;
select * from products p
where exists(select * from Orders o
where p.ProductID=o.ProductID);
22.select *
from products p 
where (select sum(quantity)
from orders
where ProductID=p.ProductID)>(
select avg(total_qty) from(
select sum(quantity) as total_qty
from orders 
group by ProductID)
avg_qty);
23.select * from Products p
where not exists(
select 1 from orders
where p.ProductID=ProductID);
24.select * from products p
where (select sum(quantity)
from orders 
where ProductID=p.ProductID)=
(select max(total_qty) 
from(select sum(quantity) as total_qty
from orders
group by ProductID)as maxs);
25.select * from products p
where (select count(*)
from orders 
where ProductID=p.ProductID)>
(select avg(counted) 
from(select count(*) as counted
from orders
group by ProductID)as avg_orders);
