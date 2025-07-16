Microsoft Windows [Version 10.0.19045.6093]
(c) Microsoft Corporation. All rights reserved.

C:\Program Files\MySQL\MySQL Server 9.3\bin>mysql -h localhost -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 9.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| abc                |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.321 sec)

mysql> create database new;
Query OK, 1 row affected (0.232 sec)

mysql> use new;
Database changed
mysql> create table new.student(rollno int , name varchar(50));
Query OK, 0 rows affected (0.328 sec)

mysql> describe student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| rollno | int         | YES  |     | NULL    |       |
| name   | varchar(50) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.168 sec)

mysql> create user 'sarthak'@localhost identified by 'sarthak123';
ERROR 1396 (HY000): Operation CREATE USER failed for 'sarthak'@'localhost'
mysql> create user 'sarthak'@localhost identified by 'root'
    -> \c
mysql> create user 'sarthak'@localhost identified by 'root';
ERROR 1396 (HY000): Operation CREATE USER failed for 'sarthak'@'localhost'
mysql> SELECT User, Host FROM mysql.user WHERE User = 'sarthak' AND Host = 'localhost';
+---------+-----------+
| User    | Host      |
+---------+-----------+
| sarthak | localhost |
+---------+-----------+
1 row in set (0.009 sec)

mysql> grant all privileges on new.* to sarthak@localhost;
Query OK, 0 rows affected (0.128 sec)

mysql> alter table student add address varchar(50);
Query OK, 0 rows affected (0.546 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| rollno  | int         | YES  |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

mysql> ALTER TABLE students MODIFY rolno INT NOT NULL;
ERROR 1146 (42S02): Table 'new.students' doesn't exist
mysql> alter table student modify rollno int NOT NULL;
Query OK, 0 rows affected (0.340 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| rollno  | int         | NO   |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.011 sec)

mysql> INSERT INTO student (rollno, name, address)
    -> VALUES (1, 'John Doe', '123 Main St');
Query OK, 1 row affected (0.158 sec)

mysql> insert into student (rollno, name, address)
    -> values (2, 'Smith Arth','456 Main St');
Query OK, 1 row affected (0.147 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| rollno  | int         | NO   |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.012 sec)

mysql> set primary key
    -> 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key
1' at line 1
mysql> set primary key 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key 1' at line 1
mysql> set primary key 1
    -> \c
mysql> alter table student
    -> add primary key(1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1)' at line 2
mysql> alter table student
    -> add primary key (1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1)' at line 2
mysql> ALTER TABLE my_table
    -> ADD PRIMARY KEY (id);
ERROR 1146 (42S02): Table 'new.my_table' doesn't exist
mysql> alter table student
    -> add primary key (rollno);
Query OK, 0 rows affected (0.791 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| rollno  | int         | NO   | PRI | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

mysql> select * from student;
+--------+------------+-------------+
| rollno | name       | address     |
+--------+------------+-------------+
|      1 | John Doe   | 123 Main St |
|      2 | Smith Arth | 456 Main St |
+--------+------------+-------------+
2 rows in set (0.059 sec)

mysql>
