

-- SQLBook: Code
DROP DATABASE IF EXISTS data_transformer;
CREATE DATABASE data_transformer;
USE data_transformer;

-- SQLBook: Markup
##  1. CUSTOMERS TABLE

-- SQLBook: Code
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'john@gmail.com', '2023-06-15'),
(2, 'Jane', 'Smith', 'jane@gmail.com', '2023-07-10'),
(3, 'Michael', 'Brown', 'michael@gmail.com', '2023-08-05'),
(4, 'Emily', 'Davis', 'emily@gmail.com', '2023-09-12'),
(5, 'David', 'Wilson', 'david@gmail.com', '2023-10-20'),
(6, 'Sarah', 'Miller', 'sarah@gmail.com', '2023-11-05'),
(7, 'James', 'Moore', 'james@gmail.com', '2023-12-15'),
(8, 'Emma', 'Taylor', 'emma@gmail.com', '2024-01-10'),
(9, 'Daniel', 'Anderson', 'daniel@gmail.com', '2024-02-18'),
(10, 'Olivia', 'Thomas', 'olivia@gmail.com', '2024-03-25');

-- SQLBook: Markup
## 2. ORDERS TABLE

-- SQLBook: Code
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-10', 350.00),
(104, 3, '2023-08-15', 125.25),
(105, 4, '2023-09-20', 500.00),
(106, 2, '2023-10-05', 275.50),
(107, 5, '2023-10-15', 425.00),
(108, 3, '2023-11-01', 180.75),
(109, 6, '2023-12-10', 320.00),
(110, 7, '2024-01-15', 450.25);

-- SQLBook: Markup
## 3. EMPLOYEES TABLE

-- SQLBook: Code
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2021-02-15', 55000),
(2, 'Susan', 'Lee', 'HR', '2020-05-10', 60000),
(3, 'Robert', 'Taylor', 'IT', '2022-01-20', 65000),
(4, 'Linda', 'Anderson', 'Finance', '2019-08-12', 70000),
(5, 'James', 'Thomas', 'Sales', '2023-03-05', 48000),
(6, 'Sarah', 'Martin', 'IT', '2021-11-18', 62000),
(7, 'Daniel', 'White', 'HR', '2022-06-25', 52000),
(8, 'Emma', 'Harris', 'Finance', '2020-09-30', 68000),
(9, 'William', 'Clark', 'Marketing', '2022-04-15', 57000),
(10, 'Sophia', 'Lewis', 'IT', '2023-07-20', 59000);

-- SQLBook: Code
USE data_transformer;

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Employees;

-- SQLBook: Markup
### Q-1 INNER JOIN

-- SQLBook: Code
USE data_transformer;

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.RegistrationDate
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;

-- SQLBook: Markup
### Q-2 LEFT JOIN

-- SQLBook: Code
USE data_transformer;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- SQLBook: Markup
### Q-3 RIGHT JOIN

-- SQLBook: Code
USE data_transformer;

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- SQLBook: Markup
### Q-4 FULL OUTER JOIN

-- SQLBook: Code
USE data_transformer;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- SQLBook: Markup
### Q-5 Subquery to find customers who have placed orders worth more than the average amount.

-- SQLBook: Code
USE data_transformer;

SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);

-- SQLBook: Markup
### Q-6 Subquery to find employees with salaries above the average salary.

-- SQLBook: Code
USE data_transformer;

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    HireDate,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- SQLBook: Markup
### Q-7 Extract the year and month from the OrderDate.

-- SQLBook: Code
USE data_transformer;

SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- SQLBook: Markup
### Q-8 Calculate the difference in days between two dates (order date and current date).

-- SQLBook: Code
USE data_transformer;

SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

-- SQLBook: Markup
### Q-9 Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY').

-- SQLBook: Code
USE data_transformer;

SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;

-- SQLBook: Markup
### Q-10 Concatenate FirstName and LastName to form a full name

-- SQLBook: Code
USE data_transformer;

SELECT
    CustomerID,
    FirstName,
    LastName,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- SQLBook: Markup
### Q-11 Replace part of a string

-- SQLBook: Code
USE data_transformer;

SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedName
FROM Customers;

-- SQLBook: Markup
### Q-12 Convert FirstName to uppercase and LastName to lowercase

-- SQLBook: Code
USE data_transformer;

SELECT
    CustomerID,
    UPPER(FirstName) AS UpperName,
    LOWER(LastName) AS LowerName
FROM Customers;

-- SQLBook: Markup
### Q-13 Trim extra spaces from the Email field

-- SQLBook: Code
USE data_transformer;

SELECT
    CustomerID,
    Email,
    TRIM(Email) AS TrimmedEmail
FROM Customers;

-- SQLBook: Markup
### Q-14 Calculate the running total of TotalAmount for each order

-- SQLBook: Code
USE data_transformer;

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;

-- SQLBook: Markup
### Q-15 Rank orders based on TotalAmount using the RANK() function

-- SQLBook: Code
USE data_transformer;

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

-- SQLBook: Markup
### Q-16 Assign a discount based on TotalAmount in orders (e.g., > 1000: 10% off. > 500: 5% off).

-- SQLBook: Code
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
        WHEN TotalAmount > 500 THEN TotalAmount * 0.05
        ELSE 0
    END AS DiscountAmount
FROM Orders;

-- SQLBook: Markup
### Q-17 Categorize employees' salaries as high, medium, or low.

-- SQLBook: Code
USE data_transformer;

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,
    CASE
        WHEN Salary > 60000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
