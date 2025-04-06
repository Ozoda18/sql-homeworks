--Easy-level tasks--
1.select Category,count(*) as totalpros
from Products
Group by Category;

2.select Category, avg(Price) as [avg]
from Products
where Category='Electronics'
Group by Category;

3.select * 
from Customers
where City like 'L%';

4.select *
from Products
where ProductName like '%er';

5.select *
from Customers
where Country like '%A';

6.select max(Price) as maxprice
from Products;

7.select StockQuantity,
IIF(StockQuantity<30,'Low Stock','Sufficient') as condition
from Products;

8.select Country,COUNT(*) as counted
from Customers
group by Country;

9.select 
Max(quantity) as [max],
min(quantity) as [min]
from Orders;

--Medium-level tasks--
10.select * from orders;
select * from invoices;
select distinct customerid
from invoices
where year(invoicedate)=2023
except
select distinct customerid
from orders;

11.select ProductName
from Products
union all
select ProductName
from Products_Discounted;

12.select ProductName
from Products
union 
select ProductName
from Products_Discounted;

13.select OrderDate, avg(totalamount) as [avg]
from orders
group by OrderDate;

14.select ProductName,Price,
case 
when Price<100 then 'low'
when Price<500 then 'mid'
when Price>500 then 'high'
else 'odd' end as pricegroup
from Products;

15.select distinct City
from Customers
order by City asc;

16.select ProductID, sum(SaleAmount) as total
from Sales
group by ProductID;

17.select * 
from Products
where ProductName like '%oo%';

18.select ProductID
from products
intersect 
select ProductID
from Products_Discounted;

--Hard-level tasks--
19.select top 3  CustomerID, 
max(TotalAmount) as totalAmount
from invoices 
group by CustomerID
order by totalAmount desc;

20.select p.ProductID, p.ProductName
from Products p
left join Products_Discounted pd
on p.ProductID=pd.ProductID;

21.select p.ProductName, count(s.Productid) as TimesSold
from Products p
join Sales s
on p.ProductID=s.productID
group by p.ProductName;

22.select top 5 ProductID,
sum(Quantity) as total
from Orders
group by ProductID
order by total desc;