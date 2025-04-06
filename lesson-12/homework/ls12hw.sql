--Easy-level questions--
1. select ASCII('A');--RESULT 65;
2.SELECT LEN('Hello World');
3.select reverse('OpenAI');
4.select concat('     ','SQL');
5.select trim('  SQL Server   ');
6.select upper('sql');
7.select left('Database',3);
8.select right('Technology',4);
9.select SUBSTRING('Programming',3,4);
10.select concat('SQL',' ','Server');
11.select replace('Apple pie','Apple','Orange');
12.select CHARINDEX('Learn','Learn SQL with LearnSQL');
13.select case when charindex('er','Server')>0 then 'Yes' else 'No' end as contain
14.select string_split('apple,orange,banana',',');
15.select power(2,3);
16.select SQRT(16);
17.select getdate();
18.select GETUTCDATE();
19.select day('2025-02-03');
20.select DATEADD(day,10,'2025-02-03');
--Medium-level tasks--
1.select char(65);
2.--difference between LTRIM() (Left Trim) and RTRIM() (Right Trim):
--LTRIM removes leading spaces (spaces at the beginning) from a string.It does not remove spaces at the end of the string.
--RTRIM removes trailing spaces (spaces at the end) from a string.It does not remove spaces at the beginning of the string.
3.select CHARINDEX('SQL','Learn SQL basics');
4.select concat_ws(',','SQL','Server');
5.select Stuff('test',1,4,'exam')
6.select SQUARE(7);
7.select left('International',5);
8.select right('Database',2);
9.select PATINDEX('%n%','Learn SQL');
10.select DATEDIFF(day,'2025-01-01','2025-02-03');
11.select month('2025-02-03');
12.select DATEPART(year,'2025-02-03')
13.select convert(time,getdate());
14.select SYSDATETIME();
15.select DATEADD(day,(7-DATEPART(Weekday,Getdate())+3)%7,Getdate()) ;
16.--GETDATE() returns the current date and time in the local time zone of the SQL Server instance.This function reflects the current date and time adjusted for the time zone where the SQL Server is located.
--GETUTCDATE() returns the current date and time in Coordinated Universal Time (UTC), which is the same worldwide, independent of time zone. This function provides the current date and time in UTC, which is useful for handling time zone differences.
17.select abs(-15);
18.select CEILING(4.57);
19.select CURRENT_TIMESTAMP;
20.select DATENAME(day,'2025-02-03');
--Hard-level tasks--
1.select Trim(REVERSE('SQL server'));
2.select STRING_AGG('City',',');
3.select case when CHARINDEX('SQL','SQL')>0 and CHARINDEX('Server','SQL')>0 then 'both'
else 'not both' end;
4.select power(5,3);
5.select string_split('apple;orange;banana',';');
6.select Trim(' SQL       ');
7.select DATEDIFF(day,'2025-01-01',getdate());
8.select DATEDIFF(month,'2023-05-01','2025-02-03');
9.select CHARINDEX('SQL',reverse('Learn SQL Server'));
10.select string_split('apple,orange,banana',',');
11.select DATEDIFF(day,'2025-01-01',getdate());
12.select left('Data Scince',4);
13.select ceiling(SQRT(225));
14.select CONCAT_WS('|','data','science')
15.select PATINDEX('xy','abc123xyz');
16.select CHARINDEX('SQL','SQL Server SQL',CHARINDEX('SQL','SQL Server SQL')+1);
17.select DATEPART(year,getdate());
18.select DATEADD(day,100,getdate());
19.select DATENAME(day,'2025-02-03');
20.select power(4,2);
select SQUARE(4)