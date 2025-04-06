--Easy-level tasks--
1.select left('Database',4);
2.select CHARINDEX('SQL','I love SQL Server');
3.select REPLACE('Hello World','World','SQL');
4.select len('Microsoft SQL Server');
5.select right('Database',3);
6.SELECT 
    SUM(LEN(word) - LEN(REPLACE(word, 'a', ''))) AS a_count
FROM (
    SELECT 'apple' AS word
    UNION ALL
    SELECT 'banana'
    UNION ALL
    SELECT 'grape'
) AS words;
7.select SUBSTRING('abcdefg',6,2);
8.select SUBSTRING('SQL is powerful',5,2);
select SUBSTRING('I love databases',3,4);
9.select CEILING(15.6789);
10.select ABS(-345.67);
--Medium-level tasks--
11.select SUBSTRING('ABCDEFG',3,3);
12.select CONCAT('XXX',SUBSTRING('Microsoft',4,6));
13.select CHARINDEX(' ','SQL Server 2025');
14.select CONCAT_WS(',','FirstName','LastName');
15.select SUBSTRING('The database is very efficient',14,2);
16.select SUBSTRING('INV1234',4,4);
select SUBSTRING('ORD5678',4,4);
17.select CEILING(99.5);
18.select DATEDIFF(day,'2025-01-01','2025-03-15');
19.select MONTH('2025-06-10');
20.select datepart(week,'2025-04-22');
--Hard-level tasks--
21.select SUBSTRING('user1@gmail.com',7,10);
select SUBSTRING('admin@company.org',7,12);
22.select substring('experince',9,1)
23.select floor(rand()*(150-100+1)+100);
24.
25.CREATE TABLE Customerss (
FullName VARCHAR(100)
);
INSERT INTO Customerss VALUES 
('John Doe'),
('Jane Smith');
select SUBSTRING('John Doe',1,4);
select SUBSTRING('Jane Smith',1,4);
26.select REPLACE('SQL Server is great', ' ', '-');
27.SELECT RIGHT('00000' + CAST(42 AS VARCHAR(5)), 5);
28.
29.select SUBSTRING('Error:Connection failed',7,17);
30.select DATEDIFF(minute,'08:15:00','09:45:00');