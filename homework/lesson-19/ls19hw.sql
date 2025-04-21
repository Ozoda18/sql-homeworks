CREATE TABLE #Employees ( EmployeeID INT PRIMARY KEY, FirstName VARCHAR(50), LastName VARCHAR(50), DepartmentID INT, Salary DECIMAL(10, 2), HireDate DATE );

INSERT INTO #Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate) VALUES (1, 'John', 'Doe', 1, 60000, '2020-01-15'), (2, 'Jane', 'Smith', 2, 70000, '2019-03-22'), (3, 'Emily', 'Johnson', 1, 65000, '2021-05-18'), (4, 'Michael', 'Williams', 3, 80000, '2018-06-30'), (5, 'Chris', 'Jones', 2, 72000, '2022-02-11'), (6, 'Katie', 'Brown', 3, 61000, '2020-12-01'), (7, 'Sarah', 'Davis', 1, 58000, '2023-01-25'), (8, 'David', 'Miller', 2, 75000, '2017-04-17'), (9, 'Laura', 'Wilson', 3, 69000, '2019-08-08'), (10, 'Mark', 'Moore', 1, 62000, '2022-03-05'), (11, 'Lisa', 'Taylor', 2, 73000, '2018-09-10'), (12, 'James', 'Anderson', 3, 72000, '2021-07-15'), (13, 'Nancy', 'Thomas', 1, 64000, '2020-05-30'), (14, 'Robert', 'Jackson', 2, 68000, '2019-11-20'), (15, 'Patricia', 'White', 3, 69000, '2018-10-01'), (16, 'Charles', 'Harris', 1, 55000, '2023-02-28'), (17, 'Jessica', 'Martinez', 2, 70000, '2021-06-20'), (18, 'Daniel', 'Thompson', 3, 67000, '2017-07-14'), (19, 'Matthew', 'Garcia', 1, 64000, '2022-04-25'), (20, 'Danielle', 'Martinez', 2, 71000, '2020-03-12'), (21, 'Paul', 'Robinson', 3, 78000, '2018-05-03'), (22, 'Michelle', 'Clark', 1, 50000, '2023-03-10'), (23, 'Joseph', 'Rodriguez', 2, 74000, '2021-02-09'), (24, 'Angela', 'Lewis', 3, 66000, '2017-08-14'), (25, 'Thomas', 'Lee', 1, 73000, '2022-01-19'), (26, 'Rebecca', 'Walker', 2, 79000, '2019-12-12'), (27, 'Scott', 'Hall', 3, 72000, '2022-06-11'), (28, 'Betty', 'Allen', 1, 52000, '2023-01-28'), (29, 'Andrew', 'Young', 2, 66000, '2021-05-15'), (30, 'Arthur', 'Hernandez', 3, 71000, '2018-09-22'), (31, 'Brittany', 'King', 1, 64000, '2020-10-05'), (32, 'Jacqueline', 'Wright', 2, 70000, '2019-11-29'), (33, 'Kelly', 'Scott', 3, 64000, '2019-08-16'), (34, 'Gary', 'Torres', 1, 68000, '2020-07-13'), (35, 'Sara', 'Nguyen', 2, 71000, '2021-04-24'), (36, 'Albert', 'Hernandez', 3, 75000, '2019-06-20'), (37, 'Samantha', 'Carter', 1, 49000, '2023-01-15'), (38, 'Steve', 'Mitchell', 2, 77000, '2018-12-01'), (39, 'Brandon', 'Perez', 3, 71000, '2020-09-11'), (40, 'Deborah', 'Roberts', 1, 56000, '2019-10-22'), (41, 'Laura', 'Turner', 2, 64000, '2021-05-04'), (42, 'Philip', 'Phillips', 3, 69000, '2018-08-30'), (43, 'Tina', 'Campbell', 1, 62000, '2020-11-07'), (44, 'Greg', 'Parker', 2, 68000, '2022-03-14'), (45, 'Dennis', 'Evans', 3, 71000, '2021-01-01'), (46, 'Rose', 'Edwards', 1, 74000, '2020-09-05'), (47, 'Rachel', 'Collins', 2, 78000, '2018-06-01'), (48, 'Jordan', 'Stewart', 3, 70000, '2021-07-20'), (49, 'Christine', 'Sanchez', 1, 61000, '2019-02-18'), (50, 'Carlos', 'Morris', 2, 90000, '2022-05-27');

CREATE TABLE #Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50), Location VARCHAR(50) );

INSERT INTO #Departments (DepartmentID, DepartmentName, Location) VALUES (1, 'Sales', 'New York'), (2, 'Engineering', 'San Francisco'), (3, 'Marketing', 'Chicago'), (4, 'Purchasing', 'Los Angeles'), (5, 'Finance', 'Miami');
1.select * from #Employees
where salary>(select avg(salary) from #Employees);
2.select * from #Employees e
where exists(select 1 from #Departments d
where e.DepartmentID=d.DepartmentID and DepartmentID=1);
3.select * from #Employees 
where DepartmentID=(select DepartmentID
from #Employees 
where FirstName='Rachel' and LastName='Collins');
4.select * from #Employees
where hiredate<
(select max(hiredate) from #Employees
where DepartmentID=2);
5.select * from #Employees e
where Salary>(select avg(salary) from #Employees e1
where e.DepartmentID=e1.DepartmentID);
6.SELECT e.*, (
    SELECT COUNT(*)
    FROM #Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
) AS DepartmentEmployeeCount
FROM #Employees e;
7.select * from #Employees
where Salary=(select min(salary) from #Employees);
8.SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary
FROM #Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM #Employees
    GROUP BY DepartmentID
    HAVING AVG(Salary) > 65000
);
9.select * from #Employees
where year(HireDate)>(select year(getdate()-3)
from #employees);
10.select * from #Employees
where DepartmentID in(
select DepartmentID
from #Employees
where salary<=80000);
11.select * from #Employees e
where salary=(
select max(salary)
from #employees e1
where e.DepartmentID=e1.DepartmentID );
12.select e.FirstName,e.LastName,d.DepartmentName,e.hiredate
from #employees e
join #Departments d 
on d.DepartmentID=e.DepartmentID
where hiredate=
(select min(hiredate)
from #Employees
where e.DepartmentID=DepartmentID);
13.SELECT d.[Location],
    d.departmentname ,
    (
        SELECT AVG(e.salary)
        FROM #Employees e
        WHERE e.departmentid = d.departmentid
    ) AS AverageSalary
FROM #departments d;
14.SELECT *
FROM #Employees e
WHERE departmentid IN (
    SELECT departmentid
    FROM #employees 
    WHERE salary = (
        SELECT AVG(salary)
        FROM #employees e2
        WHERE e2.departmentid = e.departmentid
    )
);
15.SELECT e.*, (
    SELECT COUNT(*)
    FROM #Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
) AS DepartmentEmployeeCount
FROM #Employees e;
select *
from #departments d
where
(
select count(*)
from #Employees e
where e.departmentid=d.departmentid)<(
    SELECT AVG(department_count)
    FROM (
        SELECT COUNT(*) AS department_count
        FROM #Employees
        GROUP BY departmentid
    ) AS avg_counts
);
16.select  *  from #Employees 
where DepartmentID not in(
select DepartmentID
from #Employees
group by DepartmentID
having avg(salary)=(select max(avg_sal) from(
select DepartmentID,avg(salary) as avg_sal
from #Employees
group by DepartmentID) as dept_avg));
17.select * from #Departments d
where exists(select 1 from #Employees e
where e.DepartmentID=d.DepartmentID);
18.WITH EmployeeCategories AS (
    SELECT 
        e.EmployeeID,
        e.DepartmentID,
        e.HireDate,
        CASE 
            WHEN DATEDIFF(YEAR, e.HireDate, GETDATE()) <= 3 THEN 'junior'
            ELSE 'senior'
        END AS Category
    FROM #Employees e
    WHERE EXISTS (
        SELECT 1 
        FROM #Departments d 
        WHERE d.DepartmentID = e.DepartmentID
    )
),CategoryCounts AS (
    SELECT 
        DepartmentID,
        SUM(CASE WHEN Category = 'senior' THEN 1 ELSE 0 END) AS SeniorCount,
        SUM(CASE WHEN Category = 'junior' THEN 1 ELSE 0 END) AS JuniorCount
    FROM EmployeeCategories
    GROUP BY DepartmentID
)
SELECT d.DepartmentID, d.DepartmentName, cc.SeniorCount, cc.JuniorCount
FROM CategoryCounts cc
JOIN #Departments d ON d.DepartmentID = cc.DepartmentID
WHERE cc.SeniorCount > cc.JuniorCount;
19.SELECT e.*
FROM #Employees e
JOIN (
    SELECT departmentid
    FROM #employees
    GROUP BY departmentid
    HAVING COUNT(*) = (
        SELECT MAX(department_count)
        FROM (
            SELECT COUNT(*) AS department_count
            FROM #Employees
            GROUP BY departmentid
        ) AS subquery
    )
) AS max_dept
ON e.departmentid = max_dept.departmentid;
20.SELECT departmentid, 
       MAX(salary) - MIN(salary) AS salary_difference
FROM #Employees
GROUP BY departmentid;
21.select p.ProjectName from Projects p
where not exists(select 1 from EmployeeProject e
where [role]='lead' and p.ProjectID=e.ProjectID);
22.SELECT e.FirstName, e.LastName, e.Salary
FROM employees e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM employees e2
    JOIN employeeproject ep
	ON e2.employeeid = ep.employeeid
    WHERE ep.projectid IN (
        SELECT ep.projectid
        FROM employeeproject ep
        WHERE ep.employeeid = e.employeeid
    )
);
23.select * from Projects p
where exists (select * from EmployeeProject
where(select count(*) as counted
from EmployeeProject e
where p.ProjectID=e.ProjectID)=1);
SELECT p.ProjectName
FROM projects p
WHERE p.projectid IN (
    SELECT ep.projectid
    FROM employeeproject ep
    GROUP BY ep.projectid
    HAVING COUNT(ep.employeeid) = 1
);
24.SELECT p.ProjectName, p.Budget, (
    SELECT MAX(p2.Budget)
    FROM projects p2
) - p.Budget AS BudgetDifference
FROM projects p;
25.with cte1 as (
select e.FirstName, e.LastName, ep.ProjectID ,Salary , AVG(Salary) over () as AVG_salary from  EmployeeProject ep
join employees as e on e.employeeid = ep.employeeid
where ep.role = 'Lead')
select * from cte1 
where AVG_salary < salary;
