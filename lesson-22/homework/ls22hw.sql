CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')
	select * from sales_data;
1.select *,
sum(total_amount) over (partition by Customer_id order by (select null)) as running
from sales_data;
2.select *,
count(quantity_sold)over(partition by product_category) as counted
from sales_data;
3.select max(running) from(select *,
sum(total_amount) over (partition by product_category order by (select null)) as running
from sales_data) as tab;
4.select *,
min(total_amount)over(partition by product_category) as min_pro
from sales_data
group by product_category;
5.select *,
avg(total_amount)over(order by sale_id rows between 1 preceding and 1 following)
from sales_data;
6.select *,
sum(total_amount)over(partition by region)
from sales_data;
7.select*,
row_number()over(order by total_amount desc)
from sales_data;
8.select *,
total_amount-lag(total_amount)over(partition by Customer_id order by sale_id ) differences
from sales_data;
9.with cte as(select *,
ROW_NUMBER()over(partition by product_category order by unit_price) as ranked
from sales_data)
select * from cte 
where ranked<=3;
10.SELECT *,
    SUM(total_amount) OVER (PARTITION BY Region ORDER BY Order_Date) AS CumulativeSales
FROM 
    sales_data
ORDER BY 
    Region, Order_Date;
11.SELECT *,
    SUM(total_amount) OVER (PARTITION BY product_category ORDER BY Order_Date) AS CumulativeSales
FROM 
    sales_data;
12.create table table1(ID int);
insert into table1 values (1),(2),(3),(4),(5);
select *,
sum(ID) over(order by ID rows between unbounded preceding and current row) as SumPreValues
from table1;
13.CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);
select *,
sum(Value)over(order by Value rows between 1 preceding and current row) as SumOfPrevious
from OneColumn;
14.CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), 
(102,'c'), (103,'f'), 
(103,'e'), (103,'q'), 
(104,'r'), (105,'p');
select * from Row_Nums;
select id,vals,
row_number()over(order by id,vals)+sum(rnk)over(order by id,vals)-rnk as[row number]
from(
select *,
iif(id=lead(id) over(order by id,vals),0,row_number() over(partition by id order by id,vals)%2) as rnk
from row_nums)as x;
15.WITH ranked_categories AS (
    SELECT DISTINCT
        customer_id,
        product_category
    FROM
        sales_data
),
category_counts AS (
    SELECT
        customer_id,
        product_category,
        COUNT(*) OVER (PARTITION BY customer_id) AS category_count
    FROM
        ranked_categories
)
SELECT DISTINCT
    customer_id
FROM
    category_counts
WHERE
    category_count > 1;
16.with cte as(
select *,
avg(total_amount)over(partition by region) as avg_region
from sales_data),
customer_spending AS (
    SELECT
        s.customer_id,
        s.region,
        s.total_amount,
        r.avg_region
    FROM 
       sales_data s
    JOIN
        cte r
    ON 
        s.region = r.region
)
SELECT
    *
FROM
    customer_spending
WHERE
    total_amount > avg_region
ORDER BY
    region, total_amount DESC;
17.SELECT *,
    DENSE_RANK()over(partition by region ORDER BY sale_id) AS ranked
FROM sales_data;
18.select *,
sum(total_amount)over(partition by customer_id order by order_date) as running
from sales_data
order by customer_id,order_date;
20.WITH LastOrder AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM sales_data
    GROUP BY customer_id
),
TotalOrderAmount AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_amount
    FROM sales_data
    GROUP BY customer_id
),
LastOrderAmount AS (
    SELECT
        sd.customer_id,
        sd.total_amount AS last_order_amount
    FROM sales_data sd
    INNER JOIN LastOrder lo
        ON sd.customer_id = lo.customer_id
        AND sd.order_date = lo.last_order_date
)
SELECT
    [to].customer_id
FROM TotalOrderAmount [to]
JOIN LastOrderAmount lo
    ON [to].customer_id = lo.customer_id
WHERE [to].total_amount > lo.last_order_amount; 
21.select product_name
from sales_data
where unit_price >(select avg(unit_price) 
from sales_data);
CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0),
(3,1,11,45), (4,2,0,0), 
(5,2,100,17);
22.with cte as(select *,
row_number() over(partition by grp order by id) as rn
from MyData)
select *,
case when rn=1 then
sum(val1) over(partition by grp)+ sum(val2) over(partition by grp) else null
end as tot
from cte;
23.CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), 
(1235,100,130), (1235,100,135),
(1236,12,136);
select distinct Id,
sum(cost)over (partition by ID) as cost,
sum(quantity) over (partition by ID) as quantity
from TheSumPuzzle;
24.CREATE TABLE testSuXVI (
    Level TINYINT, TyZe TINYINT, Result CHAR(1)
);
INSERT INTO testSuXVI VALUES
(0, 1 ,'X'), (1, 5 ,'X'), (2, 2 ,'X'), (3, 2 ,'Z'), (1, 8 ,'X'), (2, 6 ,'Z'),
(1, 20 ,'X'), (2, 9 ,'X'), (3, 32 ,'X'), (4, 91 ,'Z'), (2, 21 ,'Z'), (3, 30 ,'Z');
select * from testSuXVI;
select e.TyZe,e.Result,
isnull(r.type-isnull(case when r.Type is not null then lag(r.Type)over (order by case when r.Type is null then -1 else r.Type end,0),0)
from(select *,row_number()over(order by(select null)) as rnk
from testSuxVI) as e
cross apply
(
select sum(TyZe) as Type from(select *,row_number() over(order by (select null)) as rnk
from testSuXVI)as z
where z.rnk<=e.rnk and e.Result='Z'
) as r
order by e.rnk
25.create table tab (id int, vals char(1));
insert into tab values(101,'a'),
(102,'b'),(102,'c'),
(103,'f'),(103,'e'),
(103,'q'),(104,'r'),
(105,'p');

