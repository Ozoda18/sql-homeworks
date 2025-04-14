use l14;
--Easy-level tasks--
CREATE TABLE #Cart1 ( 
Item VARCHAR(100) PRIMARY KEY ); 
INSERT INTO #Cart1 (Item) VALUES 
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
CREATE TABLE #Cart2 ( 
Item VARCHAR(100) PRIMARY KEY )
INSERT INTO #Cart2 (Item) VALUES 
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
CREATE TABLE #PhoneDirectory ( 
CustomerID INTEGER,
[Type] VARCHAR(100),
PhoneNumber VARCHAR(12) NOT NULL, 
PRIMARY KEY (CustomerID, [Type]) ); 
INSERT INTO #PhoneDirectory (CustomerID, [Type], PhoneNumber) VALUES 
(1001,'Cellular','555-897-5421'), 
(1001,'Work','555-897-6542'),
(1001,'Home','555-698-9874'), 
(2002,'Cellular','555-963-6544'), 
(2002,'Work','555-812-9856'), 
(3003,'Cellular','555-987-6541'); 
CREATE TABLE #ProcessLog ( 
WorkFlow VARCHAR(100), 
ExecutionDate DATE, 
PRIMARY KEY (WorkFlow, ExecutionDate) ); 
INSERT INTO #ProcessLog (WorkFlow, ExecutionDate) VALUES 
('Alpha','6/01/2018'),
('Alpha','6/14/2018'),
('Alpha','6/15/2018'), 
('Bravo','6/1/2018'),
('Bravo','6/2/2018'),
('Bravo','6/19/2018'), 
('Charlie','6/1/2018'),
('Charlie','6/15/2018'),
('Charlie','6/30/2018'); 
CREATE TABLE #Inventory ( 
InventoryDate DATE PRIMARY KEY, 
QuantityAdjustment INTEGER NOT NULL ); 
INSERT INTO #Inventory (InventoryDate, QuantityAdjustment) VALUES
('7/1/2018',100),
('7/2/2018',75),
('7/3/2018',-150), 
('7/4/2018',50),
('7/5/2018',-75); 
CREATE TABLE #PlayerScores (
PlayerA INTEGER, 
PlayerB INTEGER, 
Score INTEGER NOT NULL, 
PRIMARY KEY (PlayerA, PlayerB) ); 
INSERT INTO #PlayerScores (PlayerA, PlayerB, Score) VALUES 
(1001,2002,150),
(3003,4004,15),
(4004,3003,125); 
CREATE TABLE #BatchStarts (
Batch CHAR(1), 
BatchStart INTEGER, 
PRIMARY KEY (Batch, BatchStart) );
CREATE TABLE #BatchLines (
Batch CHAR(1), 
Line INTEGER, 
Syntax VARCHAR(MAX), 
PRIMARY KEY (Batch, Line) ); 
INSERT INTO #BatchStarts (Batch, BatchStart) VALUES 
('A', 1), 
('A', 5); 
INSERT INTO #BatchLines (Batch, Line, Syntax) VALUES 
('A', 1, 'SELECT *'), 
('A', 2, 'FROM Account;'), 
('A', 3, 'GO'), 
('A', 4, ''),
('A', 5, 'TRUNCATE TABLE Accounts;'),
('A', 6, 'GO'); 
CREATE TABLE #Sales (
[Year] INTEGER NOT NULL,
Amount INTEGER NOT NULL ); 
INSERT INTO #Sales ([Year], Amount) VALUES 
(YEAR(GETDATE()),352645), 
(YEAR(DATEADD(YEAR,-1,GETDATE())),165565),
(YEAR(DATEADD(YEAR,-1,GETDATE())),254654),
(YEAR(DATEADD(YEAR,-2,GETDATE())),159521), 
(YEAR(DATEADD(YEAR,-2,GETDATE())),251696), 
(YEAR(DATEADD(YEAR,-3,GETDATE())),111894); 
CREATE TABLE #Groupings ( 
StepNumber INTEGER PRIMARY KEY, 
TestCase VARCHAR(100) NOT NULL, 
[Status] VARCHAR(100) NOT NULL ); 
INSERT INTO #Groupings (StepNumber, TestCase, [Status]) VALUES
(1,'Test Case 1','Passed'), 
(2,'Test Case 2','Passed'), 
(3,'Test Case 3','Passed'),
(4,'Test Case 4','Passed'), 
(5,'Test Case 5','Failed'), 
(6,'Test Case 6','Failed'), 
(7,'Test Case 7','Failed'), 
(8,'Test Case 8','Failed'), 
(9,'Test Case 9','Failed'),
(10,'Test Case 10','Passed'), 
(11,'Test Case 11','Passed'), 
(12,'Test Case 12','Passed'); 
CREATE TABLE #Spouses ( 
PrimaryID VARCHAR(100), 
SpouseID VARCHAR(100), 
PRIMARY KEY (PrimaryID, SpouseID) ); 
INSERT INTO #Spouses (PrimaryID, SpouseID) VALUES
('Pat','Charlie'),
('Jordan','Casey'), 
('Ashley','Dee'),
('Charlie','Pat'),
('Casey','Jordan'),
('Dee','Ashley'); 
CREATE TABLE #Strings ( 
QuoteId INTEGER IDENTITY(1,1) PRIMARY KEY, 
String VARCHAR(100) NOT NULL ); 
INSERT INTO #Strings (String) VALUES 
('SELECT EmpID FROM Employees;'),
('SELECT * FROM Transactions;'); 

CREATE TABLE #WorkflowSteps ( StepID INTEGER PRIMARY KEY, Workflow VARCHAR(50), [Status] VARCHAR(50) ); 

INSERT INTO #WorkflowSteps (StepID, Workflow, [Status]) VALUES (1, 'Alpha', 'Open'), (2, 'Alpha', 'Open'), (3, 'Alpha', 'Inactive'), (4, 'Alpha', 'Open'), (5, 'Bravo', 'Closed'), (6, 'Bravo', 'Closed'), (7, 'Bravo', 'Open'), (8, 'Bravo', 'Inactive'); 

CREATE TABLE #BowlingResults ( GameID INTEGER, Bowler VARCHAR(50), Score INTEGER, PRIMARY KEY (GameID, Bowler) ); 

INSERT INTO #BowlingResults (GameID, Bowler, Score) VALUES (1, 'John', 167), (1, 'Susan', 139), (1, 'Ralph', 95), (1, 'Mary', 90), (2, 'Susan', 187), (2, 'John', 155), (2, 'Dennis', 100), (2, 'Anthony', 78); 

CREATE TABLE #Boxes ( Box CHAR(1), [Length] INTEGER, Width INTEGER, Height INTEGER ); 

INSERT INTO #Boxes (Box, [Length], Width, Height) VALUES ('A', 10, 25, 15), ('B', 15, 10, 25), ('C', 10, 15, 25), ('D', 20, 30, 30), ('E', 30, 30, 20); 

CREATE TABLE lag ( BusinessEntityID INT ,SalesYear INT ,CurrentQuota DECIMAL(20,4) ) 

INSERT INTO lag SELECT 275 , 2005 , '367000.00' UNION ALL SELECT 275 , 2005 , '556000.00' UNION ALL SELECT 275 , 2006 , '502000.00' UNION ALL SELECT 275 , 2006 , '550000.00' UNION ALL SELECT 275 , 2006 , '1429000.00' UNION ALL SELECT 275 , 2006 , '1324000.00'

 CREATE TABLE [Movie] (

[MName] [varchar] (10) NULL, [AName] [varchar] (10) NULL, [Roles] [varchar] (10) NULL )

INSERT INTO Movie(MName,AName,Roles) SELECT 'A','Amitabh','Actor' UNION ALL SELECT 'A','Vinod','Villan' UNION ALL SELECT 'B','Amitabh','Actor' UNION ALL SELECT 'B','Vinod','Actor' UNION ALL SELECT 'D','Amitabh','Actor' UNION ALL SELECT 'E','Vinod','Actor'

CREATE TABLE NthHighest ( Name varchar(5) NOT NULL, Salary int NOT NULL )

INSERT INTO NthHighest(Name, Salary) VALUES ('e5', 45000), ('e3', 30000), ('e2', 49000), ('e4', 36600), ('e1', 58000)

CREATE TABLE dbo.AlternateMaleFemale ( ID INT ,NAME VARCHAR(10) ,GENDER VARCHAR(1) ) 

INSERT INTO dbo.AlternateMaleFemale(ID,NAME,GENDER) VALUES (1,'Neeraj','M'), (2,'Mayank','M'), (3,'Pawan','M'), (4,'Gopal','M'), (5,'Sandeep','M'), (6,'Isha','F'), (7,'Sugandha','F'), (8,'kritika','F')
1.select isnull(c1.item,' '),isnull(c2.item,' ') from #Cart1 c1
full join #Cart2 c2
on c1.Item=c2.Item;
2.with CTE1 as (
select *, lag(ExecutionDate) over (partition by workFlow order by executionDate) as SecDate from #ProcessLog),
cte2 as (
select workflow, datediff(day,SecDate,ExecutionDate) as Diff from CTE1)
select WorkFlow, AVG(diff) from cte2
where Diff is not null
group by WorkFlow;
3.select m1.MName
from movie m1
join movie m2
on m1.MName=m2.MName
where (m1.MName='Amitabh' and m1.Roles='actor') and (m2.MName='Vinod' and m2.Roles='actor');
4.SELECT 
    CustomerID,
    MAX(CASE WHEN PhoneRow = 1 THEN PhoneNumber END) AS PhoneNumber_1,
    MAX(CASE WHEN PhoneRow = 2 THEN PhoneNumber END) AS PhoneNumber_2,
    MAX(CASE WHEN PhoneRow = 3 THEN PhoneNumber END) AS PhoneNumber_3
FROM (
    SELECT 
        CustomerId,
        PhoneNumber,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY PhoneNumber) AS PhoneRow
    FROM #PhoneDirectory
) AS PhoneNumbers
GROUP BY CustomerID
ORDER BY CustomerID;
5. WITH cte AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1  
	FROM cte 
	WHERE num + 1 <= 100  )
SELECT num
FROM cte
WHERE num % 9 = 0;
7.select InventoryDate,
QuantityAdjustment,
sum(quantityadjustment) over (order by inventorydate) as runningbalance
from #Inventory
order by inventorydate;
8.select [Name],
Salary 
from NthHighest
order by salary desc
offset 1 row fetch next 1 row only ;
9.SELECT 
    SUM(CASE WHEN [Year] = YEAR(GETDATE()) THEN Amount ELSE 0 END) AS CurrentYearSales,
    SUM(CASE WHEN [Year] = YEAR(GETDATE()) - 1 THEN Amount ELSE 0 END) AS LastYearSales,
    SUM(CASE WHEN [year] = YEAR(GETDATE()) - 2 THEN Amount ELSE 0 END) AS TwoYearsAgoSales
FROM #Sales;
--Medium-level tasks--
1.select b1.Box as box1,
b2.box as box2,
b1.[length],
b1.height,
b1.width
from #Boxes b1
join #Boxes b2
on b1.box<b2.Box
and b1.Height=b2.Height
and b1.[Length]=b2.[Length]
and b1.Width=b2.Width;
2.with cte as(
select 1 as num
union all
select case when num*2<100 then num*2 else num+1 end
from cte
where  num<100)
select * from cte;
3.select * from #WorkflowSteps;
WITH cte AS (
  SELECT
    ws.StepID,
    ws.Workflow,
    ws.[Status],
    ws2.[Status] AS PriorStatus
  FROM #WorkflowSteps ws
  JOIN #WorkflowSteps ws2
    ON ws.StepID = ws2.StepID
)SELECT
  stepID,
  workflow,
  [Status],
  COUNT(DISTINCT PriorStatus) AS UniqueStatusesSoFar
FROM cte
GROUP BY StepID, workflow, [Status]
ORDER BY StepID;
5.WITH Grouped AS (
    SELECT 
        StepNumber,
        [Status],
        StepNumber - ROW_NUMBER() OVER (PARTITION BY [Status] ORDER BY StepNumber) AS grp
    FROM #Groupings
)
SELECT 
    MIN(StepNumber) AS MinStepNumber,
    MAX(StepNumber) AS MaxStepNumber,
    [Status],
    COUNT(*) AS ConsecutiveCount
FROM Grouped
GROUP BY [Status], grp
ORDER BY MinStepNumber;
7.SELECT 
    PrimaryID,
    SpouseID,
    CASE 
        WHEN PrimaryID < SpouseID 
        THEN PrimaryID + '_' + SpouseID
        ELSE SpouseID + '_' + PrimaryID
    END AS GroupKey
FROM #Spouses;
8.select * from #PhoneDirectory;
select CustomerID,[type],PhoneNumber,
lag(PhoneNumber) over (partition by CustomerID order by [type] ) as previous
from #PhoneDirectory;
9.WITH RankedScores AS (
    SELECT 
        GameID,
        Bowler,
        Score,
        RANK() OVER (PARTITION BY GameID ORDER BY Score DESC) AS RankInGame
    FROM #BowlingResults
),
AdjacentPairs AS (
    SELECT 
        r1.GameID,
        r1.Bowler AS Bowler1,
        r2.Bowler AS Bowler2
    FROM RankedScores r1
    JOIN RankedScores r2 
        ON r1.GameID = r2.GameID 
        AND ABS(r1.RankInGame - r2.RankInGame) = 1
        AND r1.Bowler < r2.Bowler  -- avoid duplicates like (John, Susan) and (Susan, John)
),
PairCounts AS (
    SELECT 
        Bowler1,
        Bowler2,
        COUNT(*) AS TimesTogether
    FROM AdjacentPairs
    GROUP BY Bowler1, Bowler2
)
SELECT *
FROM PairCounts
ORDER BY TimesTogether DESC;
10.with cte as(
select 1 as num
union all
select num+1 
from cte
where num<100)
select * from cte;

