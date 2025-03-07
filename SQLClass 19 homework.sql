--# SQL Homework Tasks: Window Functions and Ranking

--This document contains SQL homework tasks focusing on window functions (such as ROW_NUMBER, RANK, DENSE_RANK, NTILE, LEAD, and LAG) and cumulative calculations. The tasks are divided into three difficulty levels: **Easy**, **Medium**, and **Difficult**.

-----

--## Easy Tasks (20)

--1. Write a query to assign a row number to each employee in the **Employees** table ordered by their Salary.

select employee_name,
	   salary,
	   row_number() over (order by salary) as 'Row number'
from employees;

--2. Create a query to rank all products based on their Price in descending order.

select product_name,
       price,
	   rank() over (order by price desc) as 'Price descending'
from products;

--3. Use the **DENSE_RANK()** function to rank employees by Salary in the **Employees** table.

select *,
	   dense_rank() over (order by salary) as 'Dense rank'
from employees;

--4. Write a query to display the next (lead) salary for each employee in the same department using the **LEAD()** function.

select employee_name,
       department,
       lead(salary) over (partition by department order by salary) as 'Lead'
from employees;

--5. Use **ROW_NUMBER()** to assign a unique number to each order in the **Orders** table.

select *,
	   row_number() over (order by order_id) as 'Order Row number'
from orders;

--6. Create a query using **RANK()** to identify the highest and second-highest salaries in the **Employees** table.

select *
from 
	(select *,
	        rank() over (order by salary desc) as 'Rank'
	 from employees) as Ranked1_2
where Rank in (1, 2);

--7. Write a query to show the previous (lagged) salary for each employee in the **Employees** table using the **LAG()** function.

select *,
		lag(salary) over (partition by department order by salary) as 'Lag salary'
from employees;

--8. Use **NTILE(4)** to divide employees into 4 groups based on their Salary.

select *,
	   ntile(4) over (order by salary) as 'Ntiled'
from employees;

--9. Write a query to partition employees by **DepartmentID** and assign a row number within each department.

select *,
	   row_number() over (partition by department_id order by department_id) as 'RowNDepartment'
from employees;

--10. Use **DENSE_RANK()** to rank products by Price in ascending order.

select *,
       dense_rank() over (order by price) as 'DenseRankPrice'
from products;


--11. Write a query to calculate the moving average of Price in the **Products** table using window functions.

select *,
		avg(price) over (partition by product_name order by price) as 'AVG_price'
from products;

--12. Use the **LEAD()** function to display the salary of the next employee for each row in the **Employees** table.

select *,
	   lead(salary) over (partition by department_id order by salary desc) as 'Lead_salary'
from employees;

--13. SQL schema **Sales** table.

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each sale
    ProductID INT NOT NULL,                -- ID of the product sold
    SaleDate DATE NOT NULL,                -- Date of the sale
    Quantity INT NOT NULL,                 -- Quantity of the product sold
    Amount DECIMAL(10, 2) NOT NULL,        -- Total amount of the sale
    CustomerID INT,                        -- ID of the customer (optional)
);
	drop table sales
	INSERT INTO Sales (ProductID, SaleDate, Quantity, Amount, CustomerID)
VALUES
(1, '2023-10-01', 2, 199.98, 101),   -- Sale 1
(2, '2023-10-02', 1, 99.99, 102),    -- Sale 2
(3, '2023-10-03', 5, 499.95, 103),   -- Sale 3
(1, '2023-10-04', 3, 299.97, 104),   -- Sale 4
(4, '2023-10-05', 2, 399.98, 105),   -- Sale 5
(2, '2023-10-06', 4, 399.96, 106),   -- Sale 6
(5, '2023-10-07', 1, 149.99, 107),   -- Sale 7
(3, '2023-10-08', 2, 199.98, 108),   -- Sale 8
(4, '2023-10-09', 1, 199.99, 109),   -- Sale 9
(5, '2023-10-10', 3, 449.97, 110);   -- Sale 10

--13. Create a query to compute the cumulative sum of **SalesAmount** in the **Sales** table.

select *,
	   sum(amount) over (partition by quantity order by saledate) as 'Cumulative sum'
from sales;

--14. Use **ROW_NUMBER()** to identify the top 5 most expensive products in the **Products** table.

select *
from 
	(select *,
	        rank() over (order by price desc) as 'Rank'
	 from products) as Ranked1_2
	where Rank in (1, 2, 3, 4, 5);

--15. SQL schema Orders
drop table Orders
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT NOT NULL,                -- ID of the customer placing the order
    OrderDate DATE NOT NULL,                -- Date the order was placed
    TotalAmount INT NOT NULL,               -- Total amount of the order (integer)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(101, '2023-10-01', 199),      -- Order 1
(101, '2023-10-02', 99),       -- Order 2
(103, '2023-10-03', 499),      -- Order 3
(103, '2023-10-04', 299),      -- Order 4
(105, '2023-10-05', 399),      -- Order 5
(106, '2023-10-06', 399),      -- Order 6
(103, '2023-10-07', 149),      -- Order 7
(108, '2023-10-08', 199),      -- Order 8
(101, '2023-10-09', 199),      -- Order 9
(110, '2023-10-10', 449),      -- Order 10
(111, '2023-10-11', 299);      -- Order 11

--15. Write a query to partition the **Orders** table by **CustomerID** and calculate the total **OrderAmount** per customer.

select CustomerId,
	   sum(TotalAmount) over (partition by CustomerId order by TotalAmount) as 'TotAmoCust'
from Orders;

--16. Use **RANK()** to rank orders in the **Orders** table based on their **OrderAmount**.

select *,
       rank() over (order by TotalAmount desc) as 'TotalAmount'
from orders;

--17. Write a query to compute the percentage contribution of **SalesAmount** by **ProductCategory** in the **Sales** table.

select 
    ProductCategory,
    sum(SalesAmount) as TotalSalesAmount,
    (sum(SalesAmount) * 100.0 / sum(sum(SalesAmount)) over ()) as PercentageContribution
from 
    Sales
group by 
    ProductCategory;

--18. Use the **LEAD()** function to retrieve the next order date for each order in the **Orders** table.

select 
    OrderID,
    CustomerID,
    OrderDate,
    LEAD(OrderDate) over (partition by CustomerID order by OrderDate) as NextOrderDate
from 
    Orders;

--19. Write a query using **NTILE(3)** to divide employees into 3 groups based on their Age.

select
    EmployeeID,
    EmployeeName,
    Age,
    ntile(3) over (order by Age) as AgeGroup
from 
    Employees;

--20. Use **ROW_NUMBER()** to list the most recently hired employees from the **Employees** table.

with RankedEmployees as (
    select 
        EmployeeID,
        EmployeeName,
        HireDate,
        row_number() over (order by HireDate desc) as RowNum
    from 
        Employees
)
select 
    EmployeeID,
    EmployeeName,
    HireDate
from 
    RankedEmployees
where 
    RowNum = 1;

-----

--## Medium Tasks (20)

-- 1. Compute the cumulative average salary of employees, ordered by Salary.
SELECT EmployeeID, Salary,
       AVG(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeAvgSalary
FROM Employees;

-- 2. Rank products by their total sales while handling ties appropriately.
SELECT ProductID, SUM(SalesAmount) AS TotalSales,
       RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
FROM Sales
GROUP BY ProductID;

-- 3. Retrieve the previous order's date for each order using LAG().
SELECT OrderID, CustomerID, OrderDate,
       LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrderDate
FROM Orders;

-- 4. Calculate the moving sum of Price for products with a window frame of 3 rows.
SELECT ProductID, Price,
       SUM(Price) OVER (ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingSum
FROM Products;

-- 5. Assign employees to four salary ranges using NTILE(4).
SELECT EmployeeID, Salary,
       NTILE(4) OVER (ORDER BY Salary) AS SalaryRange
FROM Employees;

-- 6. Partition Sales table by ProductID and calculate total SalesAmount per product.
SELECT ProductID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

-- 7. Rank products by StockQuantity without gaps using DENSE_RANK().
SELECT ProductID, StockQuantity,
       DENSE_RANK() OVER (ORDER BY StockQuantity DESC) AS StockRank
FROM Products;

-- 8. Identify the second highest salary in each department using ROW_NUMBER().
WITH RankedSalaries AS (
    SELECT EmployeeID, DepartmentID, Salary,
           ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
    FROM Employees
)
SELECT EmployeeID, DepartmentID, Salary
FROM RankedSalaries
WHERE Rank = 2;

-- 9. Calculate the running total of sales for each product.
SELECT ProductID, SaleDate, SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 10. Display the SalesAmount of the next row for each employee’s sale using LEAD().
SELECT EmployeeID, SaleDate, SalesAmount,
       LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS NextSaleAmount
FROM Sales;

-- 11. Determine the highest earners within each department using RANK().
SELECT EmployeeID, DepartmentID, Salary,
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 12. Partition employees by DepartmentID and rank them by salary.
SELECT EmployeeID, DepartmentID, Salary,
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankBySalary
FROM Employees;

-- 13. Divide products into five groups based on their Price using NTILE(5).
SELECT ProductID, Price,
       NTILE(5) OVER (ORDER BY Price) AS PriceGroup
FROM Products;

-- 14. Calculate the difference between each employee's salary and the highest salary in their department.
SELECT EmployeeID, DepartmentID, Salary,
       MAX(Salary) OVER (PARTITION BY DepartmentID) - Salary AS SalaryDifference
FROM Employees;

-- 15. Display the previous product's SalesAmount for each sale using LAG().
SELECT SaleID, ProductID, SalesAmount,
       LAG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS PreviousSalesAmount
FROM Sales;

-- 16. Calculate the cumulative sum of OrderAmount for each customer.
SELECT CustomerID, OrderDate, OrderAmount,
       SUM(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeOrderTotal
FROM Orders;

-- 17. Identify the 3rd most recent order for each customer using ROW_NUMBER().
WITH OrderRanks AS (
    SELECT CustomerID, OrderID, OrderDate,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS OrderRank
    FROM Orders
)
SELECT CustomerID, OrderID, OrderDate
FROM OrderRanks
WHERE OrderRank = 3;

-- 18. Partition employees by DepartmentID and rank them by their HireDate.
SELECT EmployeeID, DepartmentID, HireDate,
       RANK() OVER (PARTITION BY DepartmentID ORDER BY HireDate) AS RankByHireDate
FROM Employees;

-- 19. Find the 3rd highest Salary in each department using DENSE_RANK().
WITH RankedSalaries AS (
    SELECT EmployeeID, DepartmentID, Salary,
           DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT EmployeeID, DepartmentID, Salary
FROM RankedSalaries
WHERE SalaryRank = 3;

-- 20. Calculate the difference in OrderDate between consecutive orders using LEAD().
SELECT OrderID, CustomerID, OrderDate,
       LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) - OrderDate AS DaysBetweenOrders
FROM Orders;


-----

--## Difficult Tasks (20)

-- 1. Rank products by their sales (handling ties) but exclude the top 10% of products by sales.
WITH RankedProducts AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales,
           RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank,
           PERCENT_RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesPercentile
    FROM Sales
    GROUP BY ProductID
)
SELECT ProductID, TotalSales, SalesRank
FROM RankedProducts
WHERE SalesPercentile > 0.1;

-- 2. List employees with over 5 years of service, ordered by their HireDate.
SELECT EmployeeID, HireDate,
       ROW_NUMBER() OVER (ORDER BY HireDate) AS RowNum
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 5;

-- 3. Divide employees into 10 groups based on Salary using NTILE(10).
SELECT EmployeeID, Salary,
       NTILE(10) OVER (ORDER BY Salary) AS SalaryGroup
FROM Employees;

-- 4. Calculate the next SalesAmount for each sale by an employee and compare it with the current sale.
SELECT EmployeeID, SaleDate, SalesAmount,
       LEAD(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS NextSalesAmount
FROM Sales;

-- 5. Partition products by CategoryID and compute the average Price for each category.
SELECT CategoryID, ProductID, Price,
       AVG(Price) OVER (PARTITION BY CategoryID) AS AvgPrice
FROM Products;

-- 6. Determine the top 3 most-sold products and display their rankings, including handling ties.
SELECT ProductID, SUM(SalesAmount) AS TotalSales,
       RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
FROM Sales
GROUP BY ProductID
HAVING RANK() OVER (ORDER BY SUM(SalesAmount) DESC) <= 3;

-- 7. List the top 5 highest-paid employees from each department using ROW_NUMBER().
WITH RankedEmployees AS (
    SELECT EmployeeID, DepartmentID, Salary,
           ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
    FROM Employees
)
SELECT EmployeeID, DepartmentID, Salary
FROM RankedEmployees
WHERE Rank <= 5;

-- 8. Compute the moving average of sales over a 5-day window using both LEAD() and LAG().
SELECT SaleID, SaleDate, SalesAmount,
       (LAG(SalesAmount, 2) OVER (ORDER BY SaleDate) + LAG(SalesAmount, 1) OVER (ORDER BY SaleDate) +
        SalesAmount +
        LEAD(SalesAmount, 1) OVER (ORDER BY SaleDate) + LEAD(SalesAmount, 2) OVER (ORDER BY SaleDate)) / 5.0 AS MovingAvg
FROM Sales;

-- 9. Find the products with the top 5 highest sales figures, ensuring no gaps in the ranking.
SELECT ProductID, SUM(SalesAmount) AS TotalSales,
       DENSE_RANK() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
FROM Sales
GROUP BY ProductID
HAVING DENSE_RANK() OVER (ORDER BY SUM(SalesAmount) DESC) <= 5;

-- 10. Partition orders by OrderAmount into four quartiles using NTILE(4).
SELECT OrderID, CustomerID, OrderAmount,
       NTILE(4) OVER (ORDER BY OrderAmount) AS OrderQuartile
FROM Orders;

-- 11. Assign a unique sequence to each order within each CustomerID using ROW_NUMBER().
SELECT OrderID, CustomerID, OrderDate,
       ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS OrderSequence
FROM Orders;

-- 12. Partition employees by DepartmentID and calculate the total number of employees in each department.
SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID;

-- 13. List the top 3 highest salaries and the bottom 3 salaries within each department using RANK().
WITH SalaryRanks AS (
    SELECT EmployeeID, DepartmentID, Salary,
           RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS HighRank,
           RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary ASC) AS LowRank
    FROM Employees
)
SELECT EmployeeID, DepartmentID, Salary
FROM SalaryRanks
WHERE HighRank <= 3 OR LowRank <= 3;

-- 14. Calculate the percentage change in SalesAmount from the previous sale for each employee using LAG().
SELECT EmployeeID, SaleDate, SalesAmount,
       LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS PreviousSalesAmount,
       (SalesAmount - LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate)) * 100.0 / NULLIF(LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate), 0) AS PercentageChange
FROM Sales;

-- 15. Compute both the cumulative sum and cumulative average of sales for each product.
SELECT ProductID, SaleDate, SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS CumulativeSum,
       AVG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS CumulativeAvg
FROM Sales;

-- 16. Rank employees by Age and display the distribution of age groups across the company using NTILE(3).
SELECT EmployeeID, Age,
       NTILE(3) OVER (ORDER BY Age) AS AgeGroup
FROM Employees;

-- 17. Identify the top 10 employees with the highest sales using ROW_NUMBER().
WITH RankedSales AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales,
           ROW_NUMBER() OVER (ORDER BY SUM(SalesAmount) DESC) AS SalesRank
    FROM Sales
    GROUP BY EmployeeID
)
SELECT EmployeeID, TotalSales
FROM RankedSales
WHERE SalesRank <= 10;

-- 18. Calculate the difference between each product's Price and the Price of the subsequent product using LEAD().
SELECT ProductID, Price,
       LEAD(Price) OVER (ORDER BY ProductID) - Price AS PriceDifference
FROM Products;

-- 19. Rank employees based on a performance score using DENSE_RANK().
SELECT EmployeeID, PerformanceScore,
       DENSE_RANK() OVER (ORDER BY PerformanceScore DESC) AS PerformanceRank
FROM Employees;

-- 20. Determine the difference in SalesAmount for each product relative to the previous and next orders using LAG() and LEAD().
SELECT OrderID, ProductID, SalesAmount,
       LAG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS PreviousSalesAmount,
       LEAD(SalesAmount) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS NextSalesAmount
FROM Orders;
