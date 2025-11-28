--SQL Basics in PostgreSQL
--SQL is divided into 4 categories:
 ________________________________________________________
|Type      |Meaning	           |Examples                |
|DDL	   |Define structure   |CREATE, ALTER, DROP     |
|DML	   |Manipulate data	   |INSERT, UPDATE, DELETE  |
|DQL	   |Query data	       |SELECT                  |
|DCL	   |Control permissions|GRANT, REVOKE           |
|-------------------------------------------------------|


⭐ 1️⃣ CREATE TABLE Query (With Explanation)
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 18),
    salary NUMERIC(10,2) DEFAULT 25000,
    department VARCHAR(30)
);

--✔  Explanation: (Column by Column)
1. emp_id SERIAL PRIMARY KEY
SERIAL → auto-generates values (1,2,3…)
PRIMARY KEY → unique + not null

2. name VARCHAR(50) NOT NULL
Must contain a name
Cannot be NULL
Maximum 50 characters

3. age INT CHECK (age > 18)
Age must be an integer
CHECK ensures age must be greater than 18

4. salary NUMERIC(10,2) DEFAULT 25000
Salary can have up to 10 digits with 2 decimals
Default salary is 25000 if not provided

5. department VARCHAR(30)
Optional column (NULL allowed)
Stores department name (max 30 characters)

⭐ 2️⃣ INSERT Queries (With Explanation)
✔ Insert 1: Insert All Values (except emp_id)
INSERT INTO employees (name, age, salary, department)
VALUES ('Arun', 28, 40000, 'IT');

--✔  Explanation::
emp_id auto-generated
All other columns provided manually

✔ Insert 2: Insert With Default Salary
INSERT INTO employees (name, age, department)
VALUES ('Meena', 30, 'HR');

--✔  Explanation::
Salary is not provided, so PostgreSQL sets it to 25000
emp_id auto-generated

✔ Insert 3: Insert Only Mandatory Columns
INSERT INTO employees (name, age)
VALUES ('Kiran', 26);

--✔  Explanation::
name and age provided
salary → defaults to 25000
department → becomes NULL
emp_id auto-generated

✔ Insert 4: Multiple Row Insert
INSERT INTO employees (name, age, salary, department)
VALUES
    ('Ravi', 35, 55000, 'Finance'),
    ('Anita', 29, 60000, 'IT'),
    ('Pooja', 32, 45000, 'HR');

--✔  Explanation::
Inserts 3 rows in a single query (faster and cleaner)

✔ Insert 5: Insert With NULL Department
INSERT INTO employees (name, age, salary, department)
VALUES ('Sachin', 27, 38000, NULL);

--✔  Explanation::
Department column is optional
NULL is allowed

✔ Insert 6: Insert Using DEFAULT Keyword
INSERT INTO employees
VALUES (DEFAULT, 'John', 25, 35000, 'Finance');

--✔  Explanation::
DEFAULT used for emp_id → auto generate
Order must match table definition exactly

✔ Insert 7: Check Constraint Success
INSERT INTO employees (name, age, salary, department)
VALUES ('Rohit', 19, 30000, 'IT');

--✔  Explanation::
Age is 19 → satisfies CHECK (age > 18)

❌ Insert Example That Fails (Age Constraint)
INSERT INTO employees (name, age) VALUES ('Divya', 16);

--✔  Explanation::
❌ Error → age must be greater than 18

⭐ Final Summary
✔ CREATE TABLE defines:
-> Structure
-> Data types
-> Constraints
-> Default values

✔ INSERT inserts data:
-> With or without default values
-> Single or multiple rows
-> With validation (check constraints)

--Select Query
SELECT * FROM employees;

--Filtering Data
SELECT name, salary
FROM employees
WHERE salary > 35000;


--Update Data
UPDATE employees
SET salary = 50000
WHERE emp_id = 2;


--Delete Data
DELETE FROM employees
WHERE emp_id = 3;