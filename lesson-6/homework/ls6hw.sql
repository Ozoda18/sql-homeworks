1.create table InputTbl(
col1 varchar(10), col2 varchar(10));
insert into InputTbl values
('a','b'),
('a','b'),
('b','a'),
('c','d'),
('c','d'),
('m','n'),
('n','m');
select * from InputTbl;

select distinct 
least(col1,col2) as col1,
greatest(col1,col2) as col2
from InputTbl;

select distinct
case when col1<col2 then col1 else col2 end as col1,
case when col1<col2 then col2 else col1 end as col2
from InputTbl;

2.create table TestMultipleZero(
A int null,
B int null,
C int null,
D int null);
insert into TestMultipleZero values
(0,0,0,1),
(0,0,1,0),
(0,1,0,0),
(1,0,0,0),
(0,0,0,0),
(1,1,1,0);
select * from TestMultipleZero;

select * from TestMultipleZero
where A!=0 or B!=0 or C!=0 or D!=0;

3.create table section1(
id int,
name varchar(20));
insert into section1 values
(1,'Been'),
(2,'Roma'),
(3,'Steven'),
(4,'Paulo'),
(5,'Genryh'),
(6,'Bruno'),
(7,'Fred'),
(8,'Andro');
select * from section1;

select * from section1
where id%2=1;

4.select top 1 *from section1
order by id ;

5.select top 1  * from section1
order by id desc;

6.select * from section1
where name like 'B%';

7.create table ProductCodes( Code varchar(20));
insert into ProductCodes values 
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');
select * from ProductCodes;

select * from ProductCodes
where Code like '%\_%' escape '\' ;
