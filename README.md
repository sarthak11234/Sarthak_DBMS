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

## 📎 Notes

- SQL syntax may vary slightly between databases (e.g., MySQL, PostgreSQL, SQL Server, Oracle).
- Always back up your data before using destructive commands like `DROP` or `TRUNCATE`.

---
