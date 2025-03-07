MERGE INTO Employees AS Target
USING NewEmployees AS Source
ON Target.EmployeeID = Source.EmployeeID
WHEN MATCHED THEN
    UPDATE SET Target.Name = Source.Name, Target.Salary = Source.Salary
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, Name, Salary)
    VALUES (Source.EmployeeID, Source.Name, Source.Salary);

MERGE INTO OldProducts AS Target
USING CurrentProducts AS Source
ON Target.ProductID = Source.ProductID
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

MERGE INTO Employees AS Target
USING NewSalaryDetails AS Source
ON Target.EmployeeID = Source.EmployeeID
WHEN MATCHED AND Source.Salary > Target.Salary THEN
    UPDATE SET Target.Salary = Source.Salary;

MERGE INTO Orders AS Target
USING NewOrders AS Source
ON Target.OrderID = Source.OrderID
WHEN MATCHED AND Target.CustomerID = Source.CustomerID AND Source.OrderAmount > Target.OrderAmount THEN
    UPDATE SET Target.OrderAmount = Source.OrderAmount
WHEN NOT MATCHED THEN
    INSERT (OrderID, CustomerID, OrderAmount)
    VALUES (Source.OrderID, Source.CustomerID, Source.OrderAmount);

MERGE INTO StudentRecords AS Target
USING (SELECT * FROM NewStudentRecords WHERE Age > 18) AS Source
ON Target.StudentID = Source.StudentID
WHEN MATCHED THEN
    UPDATE SET Target.Name = Source.Name, Target.Age = Source.Age
WHEN NOT MATCHED THEN
    INSERT (StudentID, Name, Age)
    VALUES (Source.StudentID, Source.Name, Source.Age);

INSERT INTO MergeLog (ActionType, StudentID, Timestamp)
SELECT 'INSERT', StudentID, GETDATE() FROM NewStudentRecords WHERE Age > 18;

CREATE VIEW SalesSummary AS
SELECT CustomerID, SUM(SalesAmount) AS TotalSales, COUNT(OrderID) AS OrderCount
FROM Sales
GROUP BY CustomerID;

CREATE VIEW EmployeeDepartmentDetails AS
SELECT e.EmployeeID, e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

CREATE VIEW InventoryStatus AS
SELECT ProductID, ProductName, StockQuantity
FROM Products;

CREATE FUNCTION fn_GetFullName (@FirstName NVARCHAR(50), @LastName NVARCHAR(50))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN (@FirstName + ' ' + @LastName);
END;

CREATE FUNCTION fn_GetHighSales (@Threshold DECIMAL(10,2))
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Sales WHERE SalesAmount > @Threshold
);

CREATE FUNCTION fn_GetCustomerStats ()
RETURNS @CustomerStats TABLE (CustomerID INT, TotalSpent DECIMAL(10,2), OrderCount INT)
AS
BEGIN
    INSERT INTO @CustomerStats
    SELECT CustomerID, SUM(SalesAmount), COUNT(OrderID)
    FROM Sales
    GROUP BY CustomerID;
    RETURN;
END;

SELECT CustomerID, OrderID, SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeSales
FROM Sales;

SELECT DepartmentID, EmployeeID, Salary,
       AVG(Salary) OVER (PARTITION BY DepartmentID) AS AvgSalary
FROM Employees;

SELECT CategoryID, ProductID, SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY CategoryID ORDER BY ProductID) AS CumulativeRevenue
FROM Sales;

SELECT CategoryID, SUM(SalesAmount) AS TotalRevenue
FROM Sales
GROUP BY CategoryID;

SELECT StudentID, TestScore,
       ROW_NUMBER() OVER (ORDER BY TestScore DESC) AS RowNum,
       RANK() OVER (ORDER BY TestScore DESC) AS RankNum,
       DENSE_RANK() OVER (ORDER BY TestScore DESC) AS DenseRankNum
FROM Students;

SELECT StockID, StockDate, Price,
       LAG(Price) OVER (ORDER BY StockDate) AS PreviousPrice,
       Price - LAG(Price) OVER (ORDER BY StockDate) AS PriceChange
FROM StockPrices;

SELECT StockID, StockDate, Price,
       LEAD(Price) OVER (ORDER BY StockDate) AS NextPrice,
       LEAD(Price) OVER (ORDER BY StockDate) - Price AS PriceChange
FROM StockPrices;

SELECT CustomerID, SUM(SalesAmount) AS TotalSpending,
       NTILE(4) OVER (ORDER BY SUM(SalesAmount)) AS Quartile
FROM Sales
GROUP BY CustomerID;

SELECT CustomerID, SUM(SalesAmount) AS TotalSpending,
       NTILE(5) OVER (ORDER BY SUM(SalesAmount)) AS Quintile
FROM Sales
GROUP BY CustomerID;
