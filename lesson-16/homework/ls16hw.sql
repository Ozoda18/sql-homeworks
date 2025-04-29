1.CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);
select * from Grouped;
WITH cte AS (
    SELECT Product, Quantity, 1 AS qty
    FROM Grouped
    WHERE Quantity > 0

    UNION ALL

    SELECT Product, Quantity, qty + 1
    FROM cte
    WHERE qty + 1 <= Quantity
)
SELECT Product, 1 AS Quantity
FROM cte
ORDER BY Product;
2.CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);
select * from #RegionSales
SELECT 
    r.Region,
    d.Distributor,
    COALESCE(s.Sales, 0) AS Sales
FROM 
    (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN 
    (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN 
    #RegionSales s
ON 
    s.Region = r.Region AND s.Distributor = d.Distributor
ORDER BY 
    d.Distributor, r.Region;
3.CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);
select * from Employee;
SELECT e.name
FROM employee e
WHERE e.id IN (
    SELECT managerId
    FROM employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);
4.CREATE TABLE Products (
product_id INT, 
product_name VARCHAR(40),
product_category VARCHAR(40));
CREATE TABLE Orders (
product_id INT, 
order_date DATE, unit INT);
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);
select * from Products;
select * from Orders
select p.product_name,
sum(o.unit) as total
from products p
join orders o
on o.product_id=p.product_id
where o.order_date>='2020-02-01' and o.order_date<'2020-03-01'
group by p.product_name
having sum(o.unit)>=100
order by total desc;
5. CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');
select * from Orders;
with cte as(select Customerid,vendor,count(*) as counted,
ROW_NUMBER()over(partition by customerid order by count(*) desc) as rnk
from Orders
group by customerid,vendor)
select customerid,vendor
from cte
where rnk=1;
7.CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');
select * from Device;
WITH LocationCount AS (
    SELECT 
        device_id,
        locations,
        COUNT(*) AS signal_count
    FROM device
    GROUP BY device_id, Locations
),
MaxSignalLocation AS (
    SELECT 
        device_id,
        Locations,
        signal_count,
        ROW_NUMBER() OVER (PARTITION BY device_id ORDER BY signal_count DESC) AS row_num
    FROM LocationCount
)
SELECT 
    ds.device_id,
    COUNT(DISTINCT ds.locations) AS no_of_location,
    msl.Locations AS max_signal_location,
    COUNT(*) AS no_of_signals
FROM device ds
JOIN MaxSignalLocation msl ON ds.device_id = msl.device_id AND msl.row_num = 1
GROUP BY ds.device_id, msl.locations;
8.CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);
select * from Employee;
select EmpId,EmpName,Salary
from Employee e
where salary>=(select avg(salary)
from Employee e1
where e.deptId=e1.deptId)
order by EmpId;
10.CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);
select * from Spending;
SELECT 
  spend_date,
  'Mobile' AS Platform,
  COUNT(DISTINCT user_id) AS Total_users,
  SUM(amount) AS Total_Amount
FROM Spending
WHERE user_id NOT IN (
  SELECT user_id FROM Spending WHERE platform = 'Desktop'
)
AND platform = 'Mobile'
GROUP BY spend_date

UNION ALL

SELECT 
  spend_date,
  'Desktop' AS Platform,
  COUNT(DISTINCT user_id) AS Total_users,
  SUM(amount) AS Total_Amount
FROM Spending
WHERE user_id NOT IN (
  SELECT user_id FROM Spending WHERE platform = 'Mobile'
)
AND platform = 'Desktop'
GROUP BY spend_date

UNION ALL

SELECT 
  spend_date,
  'Both' AS Platform,
  COUNT(DISTINCT user_id) AS Total_users,
  SUM(amount) AS Total_Amount
FROM Spending
WHERE user_id IN (
  SELECT user_id 
  FROM Spending 
  WHERE platform = 'Mobile'
)
AND user_id IN (
  SELECT user_id 
  FROM Spending 
  WHERE platform = 'Desktop'
)
GROUP BY spend_date;