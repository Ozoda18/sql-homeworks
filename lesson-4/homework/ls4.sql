----------Easy-level tasks----------
USE example_db;
CREATE TABLE Employeesss(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Position VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
Email VARCHAR(100)
);
INSERT INTO Employeesss VALUES
(1,'Nina','Manager','Sales',2000,'nina@gmail.com'),
(2,'Anna','Supervisor','Marketing',3000,'anna@gmail.com'),
(3,'Michael','Engineer','IT',5500,NULL),
(4,'Emily','HR Specialist','HR',6000,'emily@gmail.com'),
(5,'David','Manager','Sales',2500,'david@gmail.com'),
(6,'Daniel','Engineer','IT',4000,'daniel@gmail.com'),
(7,'Sophia','Analyst','Finance',3200,'sophia@gmailcom'),
(8,'James','Supervisor','Marketing',2800,NULL),
(9,'Alivia','Analyst','Finance',3300,'alivia@gmail.com'),
(10,'Thomas','Designer','Creative',2500,NULL);
SELECT * FROM Employeesss;
CREATE TABLE Productsss(
Pro_id INT PRIMARY KEY,
Pro_name VARCHAR(50),
Category VARCHAR(50),
Price DECIMAL(10,2),
Emp_id INT FOREIGN KEY(Emp_id) REFERENCES Employeesss(Emp_id) ON DELETE CASCADE
);
INSERT INTO Productsss VALUES
(1,'Laptop','Technique',1200,2),
(2,'Smartphone','Technique',800,6),
(3,'Monitor','Technique',300,9),
(4,'Keyboard','Technique',50,1),
(5,'Smartphone','Technique',700,8),
(6,'Laptop','Technique',1000,3),
(7,'Headphones','Technique',150,4),
(8,'Tablet','Technique',80,5),
(9,'Monitor','Technique',250,10),
(10,'Printer','Technique',200,7);
SELECT * FROM Productsss;
SELECT TOP 5 * FROM Employeesss;
SELECT DISTINCT Pro_name FROM Productsss;
SELECT * FROM Productsss
WHERE Price>100;
SELECT * FROM Employeesss
WHERE Name LIKE 'A%';
SELECT * FROM Productsss
ORDER BY Price ASC;
SELECT * FROM Employeesss
WHERE Salary>=5000 AND Department='HR';
SELECT Emp_id,Name, ISNULL(Email,'noemail@example.com') AS Email FROM Employeesss;
SELECT * FROM Productsss
WHERE Price BETWEEN 50 AND 100;
SELECT DISTINCT Pro_name,Category FROM Productsss;
SELECT * FROM Productsss
ORDER BY Pro_name DESC;
----------Medium-level tasks----------

CREATE TABLE Employeesss1(
Emp_id INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Age CHAR(2),
City VARCHAR(50),
PostalCode CHAR(10),
Position VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
Email VARCHAR(100)
);
INSERT INTO Employeesss1 VALUES
(1,'Nina','Davis',25,'New York',234127,'Manager','Sales',2000,'nina@gmail.com'),
(2,'Anna','Martinez',34,'California',456183,'Supervisor','Marketing',3000,'anna@gmail.com'),
(3,'Michael','Johnson',41,'Washington',657936,'Engineer','IT',5500,NULL),
(4,'Emily','Davis',29,'Toronto',567234,'HR Specialist','HR',6000,'emily@gmail.com'),
(5,'David','Brown',57,'New York',234127,'Manager','Sales',2500,'david@gmail.com'),
(6,'Daniel','Martinez',33,'California',456183,'Engineer','IT',4000,'daniel@gmail.com'),
(7,'Sophia','Anderson',52,'Washington',657936,'Analyst','Finance',3200,'sophia@gmailcom'),
(8,'James','Thomas',38,'Toronto',567234,'Supervisor','Marketing',2800,NULL),
(9,'Alivia','White',29,'New York',234127,'Analyst','Finance',3300,'alivia@gmail.com'),
(10,'Thomas','John',37,'California',456183,'Designer','Creative',2500,NULL);
SELECT * FROM Employeesss1;
CREATE TABLE Productsss1(
Pro_id INT PRIMARY KEY,
Pro_name VARCHAR(50),
Category VARCHAR(50),
Stock CHAR(3),
Price DECIMAL(10,2),
Emp_id INT FOREIGN KEY(Emp_id) REFERENCES Employeesss1(Emp_id) ON DELETE CASCADE
);
INSERT INTO Productsss1 VALUES
(1,'Laptop','Technique',80,1200,2),
(2,'Smartphone','Technique',120,800,6),
(3,'Monitor','Technique',30,300,9),
(4,'Keyboard','Technique',46,50,1),
(5,'Smartphone','Technique',120,700,8),
(6,'Laptop','Technique',80,1000,3),
(7,'Headphones','Technique',95,150,4),
(8,'Tablet','Technique',58,80,5),
(9,'Monitor','Technique',30,250,10),
(10,'Printer','Technique',145,200,5);
SELECT * FROM Productsss1;
SELECT TOP 10 * FROM Productsss1
ORDER BY Price DESC;
SELECT Emp_id, COALESCE(First_name,Last_name,'No name') AS First_name FROM Employeesss1;
SELECT DISTINCT Category, Price FROM Productsss1;
SELECT * FROM Employeesss1
WHERE (Age BETWEEN 30 AND 40) OR Department='Marketing';
SELECT * FROM Employeesss1
ORDER BY Salary DESC
OFFSET 4 ROWS FETCH NEXT 6 ROWS ONLY;
SELECT * FROM Productsss1
WHERE Price<=1000 AND Stock>50
ORDER BY Stock ASC;
SELECT * FROM Productsss1
WHERE Pro_name LIKE '%e%';
SELECT * FROM Employeesss1
WHERE Department IN ('HR','IT','Finance');
SELECT * FROM Employeesss1
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employeesss1);
SELECT * FROM Employeesss1
ORDER BY City ASC, PostalCode DESC;
----------Hard-level tasks----------
CREATE TABLE Employeesss2(
Emp_id INT PRIMARY KEY,
Name VARCHAR(50),
Position VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
Email VARCHAR(100)
);
INSERT INTO Employeesss2 VALUES
(1,'Nina','Manager','Sales',2000,'nina@gmail.com'),
(2,'Anna','Supervisor','Marketing',3000,'anna@gmail.com'),
(3,'Michael','Engineer','IT',5500,NULL),
(4,'Emily','HR Specialist','HR',6000,'emily@gmail.com'),
(5,'David','Manager','Sales',2500,'david@gmail.com'),
(6,'Daniel','Engineer','IT',4000,'daniel@gmail.com'),
(7,'Sophia','Analyst','Finance',3200,'sophia@gmailcom'),
(8,'James','Supervisor','Marketing',2800,NULL),
(9,'Alivia','Analyst','Finance',3300,'alivia@gmail.com'),
(10,'Thomas','Designer','Creative',2500,NULL);
SELECT * FROM Employeesss2;
CREATE TABLE Productsss2(
Pro_id INT PRIMARY KEY,
Pro_name VARCHAR(50),
Category VARCHAR(50),
Price DECIMAL(10,2),
Sales_amount CHAR(3),
Emp_id INT FOREIGN KEY(Emp_id) REFERENCES Employeesss2(Emp_id) ON DELETE CASCADE
);
INSERT INTO Productsss2 VALUES
(1,'Laptop','Technique',1200,75,2),
(2,'Smartphone','Technique',800,56,6),
(3,'Monitor','Technique',300,24,9),
(4,'Keyboard','Technique',50,67,1),
(5,'Smartphone','Technique',700,35,8),
(6,'Laptop','Technique',1000,24,3),
(7,'Headphones','Technique',150,86,4),
(8,'Tablet','Technique',80,75,5),
(9,'Monitor','Technique',250,81,10),
(10,'Printer','Technique',200,65,7);
SELECT * FROM Productsss2;
SELECT TOP(10) * FROM Productsss2
ORDER BY Sales_amount DESC;
SELECT Emp_id, COALESCE(First_name,' ')+' '+COALESCE(Last_name,' ') AS Full_name FROM Employeesss1;
SELECT DISTINCT Category,Pro_name,Price FROM Productsss2
WHERE Price>50;
SELECT * FROM Productsss2
WHERE Price BETWEEN(SELECT AVG(Price)*0.9 FROM Productsss2) AND (SELECT AVG(Price)*1.1 FROM Productsss2);
SELECT * FROM Employeesss1
WHERE Age<30 AND Department IN ('HR','IT');
SELECT * FROM Employeesss2
WHERE Email LIKE '%@gmail.com';
SELECT * FROM EmployeessS2
WHERE Salary>ALL(SELECT Salary FROM Employeesss2 WHERE Department='Sales');

SELECT * FROM Employeesss2
ORDER BY Salary DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

























