# 🚀 Data Transformer – SQL Project

## 📌 Project Overview

**Data Transformer** is a SQL-based database project created using MySQL. This project demonstrates how to create and manage relational database tables, insert records, retrieve data, and perform data transformation and analysis using SQL queries.

It includes customer information, order details, and employee records. Different SQL concepts such as Joins, Subqueries, Date Functions, String Functions, Window Functions, and CASE Expressions are used to analyze and transform the data.

---

## 🎯 Project Objectives

- Create and manage databases and tables using MySQL.
- Store and retrieve customer, order, and employee information.
- Understand relationships between tables using Primary Keys and Foreign Keys.
- Perform table joins and subqueries.
- Apply date and string functions to transform data.
- Analyze records using Window Functions.
- Categorize data using CASE Expressions.

---

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench / SQL Editor

---

## 🗂️ Database Structure

**Database Name:** `data_transformer`

This project contains three main tables:

### 1️⃣ Customers Table

Stores customer details.

| Column Name | Data Type | Description |
|---|---|---|
| CustomerID | INT (Primary Key) | Unique customer ID |
| FirstName | VARCHAR(50) | Customer first name |
| LastName | VARCHAR(50) | Customer last name |
| Email | VARCHAR(100) | Customer email address |
| RegistrationDate | DATE | Customer registration date |

### 2️⃣ Orders Table

Stores customer order information.

| Column Name | Data Type | Description |
|---|---|---|
| OrderID | INT (Primary Key) | Unique order ID |
| CustomerID | INT (Foreign Key) | References Customers table |
| OrderDate | DATE | Date of the order |
| TotalAmount | DECIMAL(10,2) | Total order amount |

### 3️⃣ Employees Table

Stores employee information.

| Column Name | Data Type | Description |
|---|---|---|
| EmployeeID | INT (Primary Key) | Unique employee ID |
| FirstName | VARCHAR(50) | Employee first name |
| LastName | VARCHAR(50) | Employee last name |
| Department | VARCHAR(50) | Employee department |
| HireDate | DATE | Employee joining date |
| Salary | DECIMAL(10,2) | Employee salary |

---

## 🔗 Table Relationships

- `Customers` and `Orders` are connected through `CustomerID`.
- `CustomerID` is the Primary Key in the Customers table.
- `CustomerID` is a Foreign Key in the Orders table.
- The Employees table stores employee information independently.

---

## 📚 SQL Concepts Covered

### 🔹 Database and Table Operations
- `CREATE DATABASE`
- `DROP DATABASE`
- `USE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`

### 🔹 Joins
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN using `UNION`

### 🔹 Subqueries
5. Find customers who placed orders above the average order amount.
6. Find employees whose salaries are above the average salary.

### 🔹 Date Functions
7. Extract year and month using `YEAR()` and `MONTH()`.
8. Calculate date differences using `DATEDIFF()` and `CURDATE()`.
9. Format dates using `DATE_FORMAT()`.

### 🔹 String Functions
10. Combine first and last names using `CONCAT()`.
11. Replace part of a string using `REPLACE()`.
12. Convert text using `UPPER()` and `LOWER()`.
13. Remove extra spaces using `TRIM()`.

### 🔹 Window Functions
14. Calculate a running total using `SUM() OVER()`.
15. Rank orders using `RANK() OVER()`.

### 🔹 CASE Expressions
16. Calculate order discounts based on order amounts.
17. Categorize employee salaries as High, Medium, or Low.

---

## ⚙️ How to Run the Project

1. Install and open MySQL Workbench or another MySQL-compatible SQL editor.
2. Open the project SQL file.
3. Execute the complete SQL script.
4. The database `data_transformer` will be created.
5. The three tables and their sample records will be inserted.
6. Run the SELECT queries to view the results of each SQL operation.

> ⚠️ Note: The script starts with `DROP DATABASE IF EXISTS data_transformer;`. Running it again will delete the existing `data_transformer` database and recreate it. Back up any important data before running it again.

---

## 📊 Project Highlights

- Three relational database tables.
- Sample customer, order, and employee records.
- Primary Key and Foreign Key relationships.
- 17 SQL questions and queries.
- Data joining, filtering, formatting, and transformation.
- Running totals, ranking, discounts, and salary categorization.

---

## 🎓 Learning Outcomes

Through this project, I practiced:

- Writing SQL queries in MySQL.
- Understanding relational database concepts.
- Joining multiple tables.
- Using subqueries for data analysis.
- Applying built-in date and string functions.
- Working with Window Functions.
- Using conditional logic with CASE Expressions.

---

## Connect with me :

Linkedin : www.linkedin.com/in/nisha-sonkusre-283526415
G-mail : nishasonkusre07@gmail.com

## ⭐ Conclusion

The **Data Transformer** project provides practical experience with MySQL and important SQL concepts. It demonstrates how relational data can be stored, connected, retrieved, transformed, and analyzed through SQL queries.

⭐ If you find this project useful, feel free to explore the queries and learn from them!
