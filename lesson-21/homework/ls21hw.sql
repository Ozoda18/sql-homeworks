CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CustomerID INT NOT NULL
);

INSERT INTO ProductSales (SaleID, ProductName, SaleDate, SaleAmount, Quantity, CustomerID)
VALUES 
(1, 'Product A', '2023-01-01', 150.00, 2, 101),
(2, 'Product B', '2023-01-02', 200.00, 3, 102),
(3, 'Product C', '2023-01-03', 250.00, 1, 103),
(4, 'Product A', '2023-01-04', 150.00, 4, 101),
(5, 'Product B', '2023-01-05', 200.00, 5, 104),
(6, 'Product C', '2023-01-06', 250.00, 2, 105),
(7, 'Product A', '2023-01-07', 150.00, 1, 101),
(8, 'Product B', '2023-01-08', 200.00, 8, 102),
(9, 'Product C', '2023-01-09', 250.00, 7, 106),
(10, 'Product A', '2023-01-10', 150.00, 2, 107),
(11, 'Product B', '2023-01-11', 200.00, 3, 108),
(12, 'Product C', '2023-01-12', 250.00, 1, 109),
(13, 'Product A', '2023-01-13', 150.00, 4, 110),
(14, 'Product B', '2023-01-14', 200.00, 5, 111),
(15, 'Product C', '2023-01-15', 250.00, 2, 112),
(16, 'Product A', '2023-01-16', 150.00, 1, 113),
(17, 'Product B', '2023-01-17', 200.00, 8, 114),
(18, 'Product C', '2023-01-18', 250.00, 7, 115),
(19, 'Product A', '2023-01-19', 150.00, 3, 116),
(20, 'Product B', '2023-01-20', 200.00, 4, 117),
(21, 'Product C', '2023-01-21', 250.00, 2, 118),
(22, 'Product A', '2023-01-22', 150.00, 5, 119),
(23, 'Product B', '2023-01-23', 200.00, 3, 120),
(24, 'Product C', '2023-01-24', 250.00, 1, 121),
(25, 'Product A', '2023-01-25', 150.00, 6, 122),
(26, 'Product B', '2023-01-26', 200.00, 7, 123),
(27, 'Product C', '2023-01-27', 250.00, 3, 124),
(28, 'Product A', '2023-01-28', 150.00, 4, 125),
(29, 'Product B', '2023-01-29', 200.00, 5, 126),
(30, 'Product C', '2023-01-30', 250.00, 2, 127);
CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);
INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');
1.select *,
row_number()over(order by saledate) as ranked
from ProductSales;
2.select ProductName,sum(quantity) as total, 
DENSE_RANK()over( order by sum(quantity) desc ) as ranked
from ProductSales
group by ProductName;
3.with cte as(select *,
ROW_NUMBER()over(partition by CustomerID order by Saleamount desc) as ranked
from ProductSales)
select * from cte
where ranked=1;
4.select SaleID,ProductName,Saledate,SaleAmount,
lead(saleamount) over(order by SaleDate) as Next_amount
from ProductSales;
5.select SaleID,ProductName,Saledate,SaleAmount,
lag(saleamount) over(order by SaleDate) as Previous_amount
from ProductSales;
6.select *,
row_number() over(partition by ProductName order by SaleDate) as ranked
from ProductSales;
7.select * from(select *,
lag(saleamount) over(order by SaleDate) as Previous_amount
from ProductSales) sub
where SaleAmount>Previous_amount;
8.select *,
lag(saleamount) over(order by SaleDate) as Previous_amount,
SaleAmount-lag(saleamount) over(order by SaleDate) as differences
from ProductSales;
9.select *,
lead(saleamount) over(order by SaleDate) as next_amount,
case 
when lead(saleamount) over(order by SaleDate) is not null
then (lead(saleamount) over(order by SaleDate)-SaleAmount)/SaleAmount*100
else null
end as per_change
from ProductSales;
10.select *,
lag(saleamount) over(partition by ProductName order by SaleDate) as previous_amount,
case
when lag(saleamount) over(partition by ProductName order by SaleDate) is not null
then SaleAmount/lag(saleamount) over(partition by ProductName order by SaleDate) 
else null end ratio
from ProductSales;
11.select *,
SaleAmount-FIRST_VALUE(saleamount)over (partition by ProductName order by saledate) as differences
from ProductSales;
12.SELECT *
FROM (
    SELECT 
        *,
        LAG(saleamount) OVER (PARTITION BY productname ORDER BY saledate) AS prev_sale_amount
    FROM ProductSales
) t
WHERE prev_sale_amount IS NOT NULL
  AND saleamount > prev_sale_amount;
13.SELECT *,
    SUM(saleamount) OVER (PARTITION BY productname ORDER BY saledate) AS closing_balance
FROM productsales;
14.SELECT *,
    AVG(saleamount) OVER (
        ORDER BY saledate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM productsales;
15.SELECT *,
    AVG(saleamount) OVER (order by saledate) AS avg_sale_amount,
    saleamount - AVG(saleamount) OVER (order by saledate) AS diff_from_avg
FROM productsales;
16.with cte as
(select *,
DENSE_RANK()over(partition by department order by salary desc) as ranked
from Employees1)
select e1.Name as Name1,
e2.Name as Name2,
e1.Salary as Salary,
e1.ranked
from cte e1
join cte e2
on e1.ranked=e2.ranked;
17.with cte as(select *,
ROW_NUMBER()over(partition by department order by Salary desc) as ranked
from Employees1)
select * from cte
where ranked<=2;
select * from Employees1
18.with cte as(select *,
ROW_NUMBER()over(partition by department order by Salary ) as lowest_ranked
from Employees1)
select * from cte
where lowest_ranked=1;
19.select *,
sum(Salary) over(partition by department order by HireDate) as running
from Employees1;
20.select *,
sum(Salary) over(partition by department ) as total
from Employees1;
21.select *,
avg(Salary) over(partition by department ) as avg_sal
from Employees1;
22.select *,
avg(Salary) over(partition by department ) as avg_sal,
Salary-avg(Salary) over(partition by department ) as differences
from Employees1;
23.select *,
avg(salary) over(order by EmployeeID rows between 1 preceding and 1 following) as moving
from Employees1;
24.select sum(salary) total_salary
from(select top 3*
from Employees1
order by HireDate desc)as last_3_hires.
