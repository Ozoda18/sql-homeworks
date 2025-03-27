create database l11
use l11;
1.create table Employees(
Empid int primary key,
Name varchar(50),
DepID  int
);
create table Departments(
DepID int primary key,
DepName varchar(50)
);
insert into Employees values (1,'Alice',101),
(2,'Bob',102),
(3,'Charlie',Null);
insert into Departments values (101,'HR'),
(102,'IT'),
(103,'Finance')
select e.Name,d.DepName 
from Employees e
inner join Departments d
on e.DepID=d.DepID;
2.create table Students(
Studentid int primary key,
StudentName varchar(50),
ClassID  int
);
create table Classes(
ClassID int primary key,
ClassName varchar(50)
);
insert into Students values 
(1,'John',201),
(2,'Emma',Null),
(3,'Liam',202);
insert into classes values (201,'Math'),
(202,'Science');
select s.StudentName,c.ClassName
from Students s
left join classes c
on s.ClassID=c.ClassID;
3.create table Orders(
OrderID int primary key,
CustomerID  int,
OrderDate date
);
create table Customers(
CustomerID int primary key,
CustomerName varchar(50)
);
insert into Orders values 
(1,301,'2024-11-01'),
(2,302,'2024-11-05');
insert into Customers values (301,'Alice'),
(302,'Bob'),
(303,'Charlie');
select *
from Orders o
right join Customers c
on o.CustomerID=c.CustomerID;
4.create table Products(
ProductID int primary key,
ProductName varchar(50)
);
create table Sales(
SaleID int primary key,
ProductID int,
Quantity int
);
insert into Products values 
(1,'Laptop'),
(2,'Tablet'),
(3,'Phone');
insert into Sales values (100,1,10),
(101,2,5),
(102,Null,8);
select p.ProductName, s.Quantity
from Products p
full outer join Sales s
on p.ProductID=s.ProductID;
5.create table Employeess(
EmplyeeID int primary key,
Name varchar(50),
ManagerID int
);
insert into Employeess values 
(1,'Alice',null),
(2,'Bob',1),
(3,'Charlie',1),
(4,'Diana',2);
select e1.Name,e2.ManagerID
from Employeess e1
left join Employeess e2
on e1.ManagerID=e2.ManagerID;
6.Create table Colors(
ColorID int primary key,
ColorName varchar(50)
);
create table Sizes(
SizeID int primary key,
SizeName varchar(50)
);
insert into Colors values (1,'Red'),
(2,'Blue');
insert into Sizes values (1,'Small'),
(2,'Medium');
select * 
from Colors c
cross join Sizes s;
7.Create table Movies(
MovieID int primary key,
Title varchar(50),
ReleaseYear int
);
create table Actors(
ActorID int primary key,
Name Varchar(50),
MovieID int
);
insert into Movies values 
(1,'Inception',2010),
(2,'Interstellar',2014),
(3,'Dune',2021);
insert into Actors values 
(101,'Leonardo DiCaprio',1),
(102,'MatthewMcConaughey',2),
(103,'Timothee Chalamet',3);
select m.Title,a.Name
from Movies m
join Actors a
on m.MovieID=a.MovieID 
where m.ReleaseYear>2015;
8.create table Orderss(
OrderID int primary key,
CustomerID int,
Orderdate date
);
create table Customerss(
CustomerID int primary key,
CustomerName varchar(50)
);
create table OrderDetails(
OrderDetailID int primary key,
OrderID int,
ProductID int
);
insert into Orderss values 
(1,401,'2024-11-01'),
(2,402,'2024-11-05');
insert into Customerss values
(401,'Alice'),
(402,'Bob');
select o.Orderdate, c.CustomerName, d.ProductID
from Orderss o
join Customerss c on o.CustomerID=c.CustomerID
join OrderDetails d on o.OrderID=d.OrderID;
9.create table Productss(
ProductID int primary key,
ProductName varchar(50),
Price decimal(10,2)
);
create table Saless(
SaleID int primary key,
ProductID int,
Quantity int
);
insert into Productss values 
(601,'TV',500),
(602,'Speaker',150);
insert into Saless values 
(1,601,3),
(2,602,5),
(3,601,2);
select p.productname,  Sum(s.quantity*p.price)
from Saless s
join Productss p
on s.productid=p.productid
group by p.ProductName;
