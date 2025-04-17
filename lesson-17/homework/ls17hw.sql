--Easy-level tasks--
1.select ProductID,[Name],ListPrice 
from Production.[Product]
where ListPrice>(select avg(listprice) from Production.[Product])
2.select *
from staff
where divisionID in(
select divisionID from staff
group by divisionID
having count(*)>10
);
3.select  em1.Emp_id,em1.[Name]
from Employeess1 em1
where salary>
(select avg(salary)
from Employeeess1
where Department=em1.Department);
4.select ID,[Name] 
from Customers
where ID in(
select ID
from Customers c
group by ID
having count([order])>0);
5.select *
from Purchasing.PurchaseOrderDetail p1
where exists(
select 1 from Purchasing.PurchaseOrderDetail p2
where p1.PurchaseID=p2.PurchaseID
);
6.select *
from Purchasing.PurchaseOrderDetail
where ProductID in(
select ProductID
from Purchasing.PurchaseOrderDetail
where OrderQty>100
);
7.select Emp_id,Emp_name,Salary
from Employeeess1
where Salary>(select avg(Salary) from Employeeess1);
8.select *
from vendors v
where v.vendorID in(
select i.vendorID
from Items i
where i.price<50
);
9.select ( 
select max(price)
from Productss
) as maxPrice;
10.select (
select max(TotalAmount)
from Purchases
) as maxPurchase;
11.select ID,[Name] 
from Customers
where ID in(
select ID
from Customers c
where [order] is null);
12.select * 
from Items  
where ItemID in(
select ItemID
from Items
where category='electronics'
);
13.select * 
from  Purchasing.PurchaseOrderDetail 
where PurchaseOrderID in(
select PurchaseOrderID
from Purchasing.PurchaseOrderDetail 
where ModifiedDate>'2012-10-18'
);
14.SELECT (
    SELECT SUM(Quantity)
    FROM PurchaseOrderDetails
    WHERE PurchaseOrderID = 310
) AS TotalItemsSold;
15.SELECT *
FROM HumanResources.Employee
WHERE HireDate <= DATEADD(YEAR, -5, GETDATE());
16.select Emp_id,
[Name],
Department
from Employeesss e1
where e1.salar>(
select avg(e2.salary)
from Employeesss e2
where e1.Emp_id=e2.Emp_id
);
18.select CustomerID,
[Name] 
from Customers c
where CustomerID in(
select CustomerID
from customers c1
where c1.purchaseDate>=DATEDIFF(day,-30,getdate());
19.select * from Items i1
where ItemId =
(select min(i2.modifiedDate)
from items i2);
20. select staffID,[Name] 
from staff s1
where staffID in(
select staffID
from staff s2
where divisionId is null);
--Medium-level tasks--
1.select *
from Employeesss1 em1
where exists(
select 1
from Employeeess1 em2
where em1.emp_id=em2.emp_id
and salary<100000);
2.SELECT *
FROM Employeeess1 s1
WHERE salary = (
    SELECT MAX(s2.salary)
    FROM Employeeess1 s2
    WHERE s2.Department = s1.Department
);
3.select * 
where not exists(
select 1 from customers c2
where c1.cus_id=c2.cus_id and price>200)
from Customers c1;
4.SELECT item_id
FROM orders
GROUP BY item_id
HAVING COUNT(*) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY item_id
    ) AS avg_counts
);
5.select *
from customers
where cus_id in(
select cus_id from customers
group by cus_id
having (count(*)>3);
6.SELECT c.client_id, c.name,
  (
    SELECT COUNT(*)
    FROM orders o
    WHERE o.client_id = c.client_id
      AND o.order_date >= DATEDIFF(day,-30,getdate()
  ) AS items_ordered_last_30_days
FROM clients c;
7.select em1.emp_id,em1.emp_name,em1.department
from employees em1 
where em1.salary>(
select avg(em2.salary)
from employees em2
where em1.department=em2.deparment);
8.select * from orders
where order_id not in(
select order_id
from orders);
9.SELECT v.vendor_id, v.vendor_name
FROM vendors v
WHERE i.price > (
    SELECT AVG(price)
    FROM items
);
10.SELECT i.item_id, i.item_name,
  (
    SELECT SUM(o.quantity)
    FROM orders o
    WHERE o.item_id = i.item_id
      AND o.order_date >= DATEDIFF(year,-1,getdate())
  ) AS total_sales_last_year
FROM items i;
11.select c1.Cus_name,c1.country,c1.age
from Customeerss c1
where c1.age>
(select avg(c2.age)
from Customeerss c2
where c1.Cus_name=c2.Cus_name);
12.select i1.it_id,i1.it_name,i1.category
from items i1
where i1.price>
(select avg(i2.price)
from items i2
where i1.it_ID=i2.it_ID);
13.select * 
from clients 
where client_id in(
select o.client_id
from orders o
join orderitems oi
on o.o.order_id=oi.order_id
join items i
on i.item_id=oi.item_id
where category='electronics');
14.select p1.Pro_id,p1.Pro_name,p1.Stock
from Productss1 p1
where p1.stock>(
select avg(p2.stock)
from productss1 p2);
15.SELECT s1.staff_id, s1.staff_name, s1.division_id
FROM staff s1
WHERE EXISTS (
    SELECT 1
    FROM staff s2
    WHERE s2.dep_id = s1.dep_id
      AND s2.bonus IS NOT NULL
);
16.select Emp_id,Emp_name,Department,Salary
from Employeeess1
where salary>(
select floor(count(salary)*0.1)
from Employeeess1);
17.SELECT division_id
FROM staff s
WHERE (
    SELECT COUNT(*)
    FROM staff s2
    WHERE s2.division_id = s.division_id
) = (
    SELECT MAX(division_count)
    FROM (
        SELECT COUNT(*) AS division_count
        FROM staff
        GROUP BY division_id
    ) AS subquery
);
18. SELECT purchase_id, item_price, quantity, (item_price * quantity) AS total_value
FROM purchases
WHERE (item_price * quantity) = (
    SELECT MAX(item_price * quantity)
    FROM purchases
);
19.sELECT s.staff_id, s.salary, s.hire_date, s.division_id
FROM staff s
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM staff s2
    WHERE s2.division_id = s.division_id
	AND dateDIFF(YEAR, s.hire_date, getdate()) > 5
);
20.SELECT c.client_id, c.client_name
FROM clients c
WHERE NOT EXISTS (
    SELECT 1
    FROM purchases p
    WHERE p.client_id = c.client_id
    AND p.item_price > 100
);
--Hard-level tasks--
1.sELECT s.staff_id, s.salary, s.hire_date, s.division_id
FROM staff s
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM staff s2
    WHERE s2.dep_id = s.dep_id
	)
	AND s.salary < (
    SELECT MAX(s3.salary)
    FROM staff s3
    WHERE s3.division_id = s.division_id
);
2.SELECT DISTINCT i.item_id, i.item_name
FROM items i
WHERE client_id IN (
    SELECT client_id
    FROM orders o
	where o.order_id = i.order_id
    GROUP BY client_id
    HAVING COUNT(order_id) > 5
);
3.SELECT staff_id, [name], age, salary
FROM staff
WHERE age > (SELECT AVG(age) FROM staff)
  AND salary > (SELECT AVG(salary) FROM staff);
4.SELECT s.staff_id, s.[name], s.department
FROM staff s
WHERE EXISTS (
    SELECT 1
    FROM staff s2
    WHERE s2.department = s.department
    GROUP BY s2.department
    HAVING COUNT(*) > 5 AND AVG(s2.salary) > 100000
);
5.SELECT i.item_id, i.item_name
FROM items i
WHERE i.item_id NOT IN (
    SELECT oi.item_id
    FROM order_items oi
    WHERE oi.order_date > datediff(year,-1,getdate())
);
6.select *
from clients c1
where exists(
select 1 from 
clients c2
where c1.category=c2.category
group by c2.category
having count(*) >=2);
7.SELECT s.staff_id, s.[name], s.salary, s.job_position
FROM staff s
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM staff s2
    WHERE s2.job_position = s.job_position
);
8.SELECT i.item_id, i.item_name, i.price
FROM items i
WHERE i.price > (
    SELECT floor(count(salary)*0.1)
    FROM items
);
9.SELECT s.staff_id, s.name, s.salary, s.department
FROM staff s
WHERE s.salary > (
    SELECT  floor(count(salary)*0.1)
    FROM staff s2
    WHERE s2.department = s.department
);
10.SELECT s.staff_id, s.[name]
FROM staff s
WHERE s.staff_id NOT IN (
    SELECT b.staff_id
    FROM bonuses b
    WHERE b.date_received > datediff(month,-6,getdate())
);
11.SELECT i.item_id, i.item_name
FROM items i
WHERE (
    SELECT COUNT(oi.order_id)
    FROM order_items oi
    WHERE oi.item_id = i.item_id
) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(oi.order_id) AS order_count
        FROM order_items oi
        GROUP BY oi.item_id
    ) AS avg_orders
);
12. select *
from orders 
where orderDate=datediff(year,-1,getdate()) and orderID in 
(select orderID
from order_items
where item_id in
(SELECT item_id
      FROM items
      WHERE price > (
        SELECT AVG(price) FROM items)));
13.SELECT s.department, AVG(s.salary) AS avg_salary
FROM staff s
GROUP BY s.department
HAVING AVG(s.salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM staff
        GROUP BY department
    ) AS dep_avg
);
14.SELECT i.item_id, i.item_name
FROM items i
WHERE client_id IN (
    SELECT client_id
    FROM orders o
	where o.order_id = i.order_id
    GROUP BY client_id
    HAVING COUNT(order_id) > 10
);
15.SELECT s.staff_id, s.[name], s.division
FROM staff s
WHERE s.department = (
select top 1 department
from sales 
group by department
order by sum(sales_amount) desc)
16.SELECT s.staff_id, s.[name], s.salary
FROM staff s
WHERE s.salary >= (
    SELECT floor(count(salary)*0.05)
    FROM staff
);
17.SELECT i.item_id, i.item_name
FROM items i
WHERE i.item_id NOT IN (
    SELECT o.item_id
    FROM orders o
    WHERE o.order_date > datediff(month,-1,getdate());
18.SELECT s.staff_id, s.[name], s.department
FROM staff s
WHERE s.department = (
    SELECT top 1 s2.department
    FROM staff s2
    GROUP BY s2.staff_id
    ORDER BY SUM(s2.total_sales) DESC
);
19.SELECT c.client_id, c.client_name
FROM clients c
WHERE c.client_id NOT IN (
    SELECT o.client_id
    FROM orders o
    WHERE o.order_date > datediff(month,-6,getdate())
) and c.client_id IN (
    SELECT o.client_id
    FROM orders o
    GROUP BY o.client_id
    HAVING SUM(o.price) < 100
);
20.SELECT s.staff_id, s.name
FROM staff s
where hiredate<DATEDIFF(year,-10,getdate()) and staff_id in(
select staff_id from staff
group by staff_id
having sum(price)>10000);