---DDL-Data definition language.It consistsbof SQL commands used to define and modify database structures, such as tables, schemas. DDL commands include Create, Alter,Drop,Truncate.
---DML-Data manipulation language. It consists of SQL commands used to manage and manipulate data. DML commands include Select,Insert,Update,Delete.
---Easy-level task---
CREATE TABLE Employees(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Salary DECIMAL(10,2)
);
INSERT INTO Employees VALUES 
(1,'Smith',1500),
(2,'Jordan',2300),
(3,'Johnathan',2000);
SELECT * FROM Employees;
UPDATE Employees
SET Salary=2800 WHERE Emp_id=1;
DELETE FROM Employees WHERE Emp_id=2;
--DELETE-removes specific rows from a table based on a condition.Keeps table structure.
--Truncate- removes all rows from a table but keeps its structure. Faster than delete.
--Drop-completely removes a table(or database),including its structure.
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
ALTER TABLE Employees
ADD Department VARCHAR(50);

---Medium-level task---
CREATE TABLE Employeess(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Salary DECIMAL(10,2)
);
INSERT INTO Employeess VALUES 
(1,'Smith',1500),
(2,'Jordan',2300),
(3,'Johnathan',2000);
SELECT * FROM Employeess;
CREATE TABLE Departments(
Dep_id INT PRIMARY KEY,
Dep_name VARCHAR(50),
Emp_id INT FOREIGN KEY(Emp_id) REFERENCES Employeess(Emp_id)
);
INSERT INTO Departments VALUES
(1,'Finance',2),
(2,'Sales',1),
(3,'Marketing',3),
(4,'IT',2),
(5,'HR',3);
SELECT * FROM Departments;
UPDATE Employeess
SET Department='Management' WHERE Salary>5000;
TRUNCATE TABLE Employeess;
--VARCHAR-uses less storage for English and other non-unicode text.
--NVARCHAR-used for storing multilingual text.
ALTER TABLE Employeess
ALTER COLUMN Salary FLOAT;
ALTER TABLE Departments
DROP COLUMN Dep_name;
CREATE TABLE #TempEmployees(
Emp_id INT,
Name VARCHAR(50),
Salary DECIMAL(10,2)
);
INSERT INTO #TempEmployees VALUES
(1,'Alice Johnson',5500),
(2,'Bob Smith',4000);
SELECT * FROM #TempEmployees;
---Hard-level task---
CREATE Table Customers(
Cus_id INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
CHECK(Age>18)
);
SELECT * FROM Customers;




