# 📘 SQL Commands Cheat Sheet with Examples

This README provides a comprehensive overview of commonly used SQL commands, organized by category, with their purpose and usage examples.

---

## 🏗️ Data Definition Language (DDL)

Commands used to define and modify database structure.

| Command      | Description | Example |
|--------------|-------------|---------|
| `CREATE`     | Creates a new table, database, view, index, etc. | `CREATE TABLE employees (id INT, name VARCHAR(100));` |
| `ALTER`      | Modifies an existing database object. | `ALTER TABLE employees ADD COLUMN salary DECIMAL(10,2);` |
| `DROP`       | Deletes a table, database, or object permanently. | `DROP TABLE employees;` |
| `TRUNCATE`   | Removes all rows from a table. | `TRUNCATE TABLE employees;` |
| `RENAME`     | Renames a database object. | `ALTER TABLE employees RENAME TO staff;` |

---

## 📥 Data Manipulation Language (DML)

Commands used to manage data within tables.

| Command    | Description | Example |
|------------|-------------|---------|
| `SELECT`   | Retrieves data. | `SELECT name FROM employees WHERE salary > 50000;` |
| `INSERT`   | Adds new rows. | `INSERT INTO employees (id, name, salary) VALUES (1, 'Alice', 60000);` |
| `UPDATE`   | Modifies data. | `UPDATE employees SET salary = 65000 WHERE id = 1;` |
| `DELETE`   | Removes rows. | `DELETE FROM employees WHERE id = 1;` |
| `MERGE`    | Combines insert/update/delete. | `MERGE INTO employees USING new_data ON employees.id = new_data.id WHEN MATCHED THEN UPDATE SET salary = new_data.salary WHEN NOT MATCHED THEN INSERT VALUES (...);` |

---

## 🔐 Data Control Language (DCL)

Commands used to control access to data.

| Command    | Description | Example |
|------------|-------------|---------|
| `GRANT`    | Gives privileges. | `GRANT SELECT, INSERT ON employees TO user1;` |
| `REVOKE`   | Removes privileges. | `REVOKE INSERT ON employees FROM user1;` |

---

## ⚙️ Transaction Control Language (TCL)

Commands used to manage transactions.

| Command     | Description | Example |
|-------------|-------------|---------|
| `COMMIT`    | Saves changes. | `COMMIT;` |
| `ROLLBACK`  | Undoes changes. | `ROLLBACK;` |
| `SAVEPOINT` | Sets rollback point. | `SAVEPOINT before_update;` |
| `SET TRANSACTION` | Sets transaction properties. | `SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;` |

---

## 🔍 Common SQL Clauses & Keywords

| Clause / Keyword | Description | Example |
|------------------|-------------|---------|
| `WHERE`          | Filters rows. | `SELECT * FROM employees WHERE salary > 50000;` |
| `GROUP BY`       | Groups rows. | `SELECT department, AVG(salary) FROM employees GROUP BY department;` |
| `HAVING`         | Filters groups. | `SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 5;` |
| `ORDER BY`       | Sorts results. | `SELECT * FROM employees ORDER BY salary DESC;` |
| `JOIN`           | Combines tables. | `SELECT e.name, d.name FROM employees e JOIN departments d ON e.dept_id = d.id;` |
| `UNION`          | Combines results (no duplicates). | `SELECT name FROM employees UNION SELECT name FROM managers;` |
| `UNION ALL`      | Combines results (with duplicates). | `SELECT name FROM employees UNION ALL SELECT name FROM managers;` |
| `IN`             | Checks list membership. | `SELECT * FROM employees WHERE department IN ('HR', 'Finance');` |
| `BETWEEN`        | Checks range. | `SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;` |
| `LIKE`           | Pattern matching. | `SELECT * FROM employees WHERE name LIKE 'A%';` |
| `IS NULL`        | Checks for nulls. | `SELECT * FROM employees WHERE manager_id IS NULL;` |
| `DISTINCT`       | Removes duplicates. | `SELECT DISTINCT department FROM employees;` |
| `LIMIT` / `TOP`  | Limits rows. | `SELECT * FROM employees LIMIT 10;` (MySQL) / `SELECT TOP 10 * FROM employees;` (SQL Server) |
| `CASE`           | Conditional logic. | `SELECT name, CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END AS salary_level FROM employees;` |
| `EXISTS`         | Checks subquery existence. | `SELECT name FROM employees WHERE EXISTS (SELECT 1 FROM managers WHERE managers.id = employees.manager_id);` |
| `SUBQUERY`       | Nested query. | `SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);` |

---

# 📘 SQL Constraints – Reference Table

This document provides a tabular overview of SQL constraints with examples for each type. Constraints are essential for maintaining data integrity and enforcing business rules in relational databases.

---

## 📋 Constraints Overview

| Constraint     | Description                                                                 | Example                                                                 |
|----------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|
| `NOT NULL`     | Ensures a column cannot have a NULL value                                   | `FirstName VARCHAR(50) NOT NULL`                                        |
| `UNIQUE`       | Ensures all values in a column are different                                | `Email VARCHAR(255) UNIQUE`                                             |
| `PRIMARY KEY`  | Uniquely identifies each record in a table (`NOT NULL` + `UNIQUE`)          | `ProductID INT PRIMARY KEY`                                             |
| `FOREIGN KEY`  | Enforces referential integrity between two tables                           | `FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)`             |
| `CHECK`        | Ensures values in a column meet a specific condition                        | `Age INT CHECK (Age >= 18)`                                             |
| `DEFAULT`      | Sets a default value when no value is provided                              | `Status VARCHAR(20) DEFAULT 'Active'`                                   |

---

## 🧪 Full Examples

| Use Case         | SQL Example                                                                 |
|------------------|------------------------------------------------------------------------------|
| Create table with `NOT NULL`                              | `CREATE TABLE Employees (ID INT NOT NULL, Name VARCHAR(100) NOT NULL);` |
| Add `UNIQUE` constraint                                   | `CREATE TABLE Users (UserID INT PRIMARY KEY, Email VARCHAR(255) UNIQUE);` |
| Define `PRIMARY KEY`                                     | `CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(100));` |
| Composite `PRIMARY KEY`                                  | `CREATE TABLE OrderItems (OrderID INT, ProductID INT, PRIMARY KEY (OrderID, ProductID));` |
| Add `FOREIGN KEY` relationship                           | `CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerID INT, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));` |
| Use `CHECK` for validation                               | `CREATE TABLE Employees (EmployeeID INT PRIMARY KEY, Age INT CHECK (Age >= 18));` |
| Set `DEFAULT` value                                      | `CREATE TABLE Accounts (AccountID INT PRIMARY KEY, Status VARCHAR(20) DEFAULT 'Active');` |

---

## 🔄 Altering Constraints

| Operation         | SQL Command                                                                 |
|-------------------|------------------------------------------------------------------------------|
| Add a constraint  | `ALTER TABLE Employees ADD CONSTRAINT chk_age CHECK (Age >= 18);`           |
| Drop a constraint | `ALTER TABLE Employees DROP CONSTRAINT chk_age;`                            |

> ⚠️ Constraint names must be known to drop them. Use system views or `INFORMATION_SCHEMA` to find them if needed.

---

## ✅ Best Practices

| Tip                          | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| Name your constraints        | Use meaningful names like `chk_salary`, `fk_order_customer`                |
| Use `FOREIGN KEY` wisely     | Enforce relationships between tables to prevent orphan records             |
| Validate with `CHECK`        | Apply business rules directly in the schema                                |
| Use `DEFAULT` values         | Avoid NULLs and simplify data entry                                        |

---


## 📎 Notes

- SQL syntax may vary slightly between databases (e.g., MySQL, PostgreSQL, SQL Server, Oracle).
- Always back up your data before using destructive commands like `DROP` or `TRUNCATE`.

---
