--Easy-level tasks--
use L8;
1. select *
from Orders o
inner join Customers c
on o.CustomerID=c.CustomerID and year(o.OrderDate)>2022;
2. select *
from employees e
join departments d
on e.depID=d.deptid and (e.Position='Sales Manager' or e.Position='Marketing Executive');
3.select *
from orders o
join
(
select * 
from products 
where price>100
) p
on o.OrderID=p.ProductID;
4.select *
from Temp_orders t
join Orders o
on t.orderid=o.orderid;
5.select *
from Employees e
cross apply
(
select top 5 *
from departments d
where e.depid=d.deptid
) filtered;
6.select *
from customers c
join orders1 o
on c.CustomerID=o.CustomerID and year(o.OrderDate)=2023 and o.loyaltystatus='gold';
7.select c.CustomerID
from customers c
join
(
select customerid, count(*) 
from orders 
group by customerid
) ordercounts 
on c.CustomerID=ordercounts.CustomerID;
8. select *
from products p
join suppliers s
on p.ProductID=s.productID and (s.suppliedby='SupplierA' or s.suppliedby='SuppliedB');
9.select *
from Employees e
outer apply
(
select top 10 orderdate
from orders1 ord
where e.EmployeeID=ord.empid
order by ord.orderdate desc
) recentorders;
10.select d.DeptID,d.Head
from departments d
cross apply
(
select *
from employees e
where d.DeptID=e.DepID
) emplist;
--Medium-level tasks--
11. select * 
from orders o
join customers c
on o.CustomerID=c.CustomerID and o.TotalAmount>5000;
12.select * 
from products1 p
join sales s
on p.ProductID=s.ProductID and (year(s.SaleDate)=2022 or p.discount>20);
13.select * from products1;
select * from sales
select p.ProductID
from products1 p
join
(
select productid, sum(TotalPrice)
from Sales 
group by ProductID
) filtered
on p.ProductID=filtered.ProductID;
14.select *
from products p
join 
( 
select *
from temp_products t
where t.discountinued=1
) filtered
on p.ProductID=filtered.productid;
15.select *
from Employees e
cross apply
(
select *
from sales s
where e.EmployeeID=s.CustomerID
) as salesperformence;
16.select *
from employees e
join departments d
on e.DepID=d.DeptID and e.Position='Human Resouces' and e.Salary>5000;
17.select *
from orders o
join payments p
on o.CustomerID=p.CustomerID and (p.paymentsituation='fully' or p.paymentsituation='partially');
18.select * 
from customers c
outer apply
(
select top 10 *
from orders o
where c.CustomerID=o.CustomerID
order by o.OrderDate desc
) as recentorders;
19.select *
from products p
join sales s
on p.ProductID=s.ProductID and year(s.SaleDate)=2023 and s.rating>4;
20.select *
from employees e
join departments d
on e.DepID=d.DeptID and (e.Department='Sales' or e.Position like '%Manager%');
--Hard-level tasks--
21.select * 
from orders1 o
join customers c
on o.customerid=c.customerid and c.region='New York' and o.ordernumbers>10;
22.select * 
from products p
join sales s
on p.ProductID=s.ProductID and (p.Category='electronics' or s.discount>15).
23.select * 
from categories c
join
(
select CatgeoryID, count(*)
from products
group by CatgeoryiD
) filtered
on c.categoryid=filtered.catgeoryid;
24.select *
from Temp_Employees t
join Employees e
on e.EmployeeID=t.employeeid and t.salary>4000 and e.Department='IT';
25.select *
from Departments d
cross apply
(
select count(*)
from Employees e
where e.DepID=d.DeptID
) as empcount;
26.select *
from orders1 o
join Customers c
on o.CustomerID=c.CustomerID and c.Region='california' and o.ordernumbers>1000;
27.select *
from employees e
join Departments d
on e.DepID=d.DeptID and ((e.Department='human Resources' or e.Department='Finance') or e.Position like '%executive%');
28.select *
from Customers c
outer apply
(
select top 6*
from orders1 o
where c.CustomerID=o.customerid
order by o.orderdate desc) as Latestorder
where Latestorder.ordernumbers is null;
29.select *
from sales s
join products p
on s.ProductID=p.ProductID and p.StockQuantity>100 and p.Price<50;
30.select *
from Employees e
join Departments d
on e.DepID=d.DeptID and (e.Department='Sales' or e.Department='Marketing') and e.Salary>6000; 

