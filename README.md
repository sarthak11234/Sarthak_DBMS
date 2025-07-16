1. mysql -h localhost -u root -p
Use: Connect to the MySQL server on localhost as user root. The -p prompts for the password.

2. show databases;
Use: List all databases available on the MySQL server.

3. create database new;
Use: Create a new database called new.

4. use new;
Use: Select the database new to start working with it.

5. create table new.student(rollno int , name varchar(50));
Use: Create a table named student in the new database with two columns: rollno (integer) and name (string up to 50 characters).

6. describe student; or desc student;
Use: Show the structure of the student table, including columns, types, nullability, keys, etc.

7. create user 'sarthak'@localhost identified by 'sarthak123';
Use: Create a new MySQL user named sarthak that can connect from localhost with the specified password.

Note: This command failed because the user already existed.

8. SELECT User, Host FROM mysql.user WHERE User = 'sarthak' AND Host = 'localhost';
Use: Check if the user sarthak exists on localhost in the MySQL user table.

9. grant all privileges on new.* to sarthak@localhost;
Use: Grant all privileges on all tables in the new database to the user sarthak from localhost.

10. alter table student add address varchar(50);
Use: Add a new column address of type varchar(50) to the student table.

11. alter table student modify rollno int NOT NULL;
Use: Change the column rollno in the student table to not allow NULL values.

12. INSERT INTO student (rollno, name, address) VALUES (1, 'John Doe', '123 Main St');
Use: Insert a new row with values (1, 'John Doe', '123 Main St') into the student table.

13. insert into student (rollno, name, address) values (2, 'Smith Arth','456 Main St');
Use: Insert another row into the student table with different values.

14. alter table student add primary key (rollno);
Use: Add a primary key constraint on the rollno column of the student table, ensuring uniqueness and indexing.

15. select * from student;
Use: Retrieve all rows and columns from the student table.
