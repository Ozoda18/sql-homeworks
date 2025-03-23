use L8;
1.Select  emp.FirstName,
emp.Salary,
dep.DeptName
from Employees emp
inner join Departments dep
on emp.DepID=dep.DeptID
where emp.Salary<5000;
2.select *
from customers c
inner join orders o
on c.CustomerID=o.CustomerID
where year(o.OrderDate)=2023
3.select*
from Employees e
left join Departments d
on DepID=DeptID;
4.select *
from Products p
right join Suppliers s
on s.SupplierID=p.ProductID;
5.select *
from Orders o
full join Payments p
on o.OrderID=p.OrderID;
6.select * 
from Employees e1
left join Employees e2
on e1.EmployeeID=e2.DepID;
7.select * 
from Products p
join Sales s
on p.productID=s.ProductID
where Quantity>2;
8.select * 
from students s
inner join courses c
on s.courseId=c.courseID
where s.course='Math101';
9.select c.firstname,count(o.OrderId)
from Customers c
inner join Orders o
on c.customerid=o.customerid
group by c.firstname
Having Count(o.OrderID)>3;
10.select *
from Employees e
left join Departments d
on d.DeptId=e.depId
where e.position='HR manager';
--Medium-level tasks--
11.select *
from Employees e
inner join Departments d
on d.DeptiD=e.DepId
where e.depID in ( select DepID from Employees group by DepID having count(*)>10);
12.select *
from products p
left join sales s
on p.productid=s.productid
where p.stockquantity is null;
13.select *
from customers c
right join orders o
on c.customerid=o.customerid
where o.orderID is not null;
14.select * 
from employees e
full join departments d
on e.depid=d.deptid
where e.depid is null;
15.select * 
from Employees e1
left join Employees e2
on e1.employeeid=e2.depid;
16.select * 
from Orders o
left join Customers c
on o.customerid=c.customerid
where year(o.orderdate)>2022;
17.select * 
from Employees e
inner join Departments d
on e.depId=d.deptid
where e.salary>5000;
18. select *
from Employees e
inner join Departments d
on e.depid=d.deptid
where e.department='it';
19.select *
from orders o
full join payments p
on o.orderid=p.orderid
where p.paymentid is not null;
20.select * 
from products p
left join orders o
on o.orderid=p.productid
where o.orderid is null;
--hard-level tasks--
21.select * 
from Employees e 
join departments d
on e.depid=d.deptid
where e.salary>(select avg(e2.salary) from employees e2 where e2.depid=e.depid);
22.select *
from orders o
left join payments p
on o.orderid=p.orderid
where p.paymentid is null and o.orderdate<'2020';
23.select * from products p
full join category c
on p.productid=c.pro_id
where c.id is null;
24.select *
from employees e1
left join employees e2
on e1.employeeid=e2.employeeid
where e1.salary>5000;
25.select *
from Employees e
right join departments d
on e.depid=d.deptid
where e.department like 'M%';
26.select *
from products p
inner join sales s
on p.productid=s.productid
where s.quantity>1000;
27.select *
from students s
left join courses c
on s.courseid=c.courseid
where s.course<>'math101';
28.select *
from orders o
left join payments p
on o.orderid=p.orderid
where p.paymentid is null;
29.select *
from products p
inner join category c
on p.productid=c.Pro_id
where c.name in ('tech','cloth');
30.select c.FirstName 
from customers c
cross join orders o
where year(o.orderdate)=2023
group by c.firstname
having Count(o.orderid)>2;








