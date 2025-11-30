| Constraint    | Purpose                         |
| ------------- | ------------------------------- |
| NOT NULL      | Prevents empty values           |
| UNIQUE        | No duplicate values             |
| PRIMARY KEY   | Unique + Not NULL               |
| FOREIGN KEY   | Link tables, maintain integrity |
| CHECK         | Enforce rules (age > 18)        |
| DEFAULT       | Auto value when not provided    |
| COMPOSITE KEY | Multiple-column primary key     |


--Constraints
--NOT NULL Constraint
✔ Meaning:
Column must have a value.
Cannot be left blank.

✔ Example:
CREATE TABLE students (
    id SERIAL,
    name VARCHAR(50) NOT NULL
);

--UNIQUE Constraint
✔ Meaning:
Value must be unique in the column.
No duplicates allowed.

Example:
Email should be unique

✔ Example:
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

--PRIMARY KEY Constraint
✔ Meaning:
Uniquely identifies each row
Automatically UNIQUE + NOT NULL

✔ Example:
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
Primary key ensures no two employees have the same emp_id.


--FOREIGN KEY Constraint
✔ Meaning:

Used to link two tables together.
Maintains referential integrity.

✔ Example:
Departments table:
CREATE TABLE department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT REFERENCES department(dept_id)
);


--CHECK Constraint
✔ Meaning:
Ensures a column follows a condition.
Examples:
Age > 18
Salary > 0
Marks between 0 and 100
✔ Example:
CREATE TABLE workers (
    id SERIAL PRIMARY KEY,
    age INT CHECK (age >= 18),
    salary INT CHECK (salary > 0)
);


--DEFAULT Constraint
✔ Meaning:
Gives a default value if user does not provide one.

✔ Example:
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    balance INT DEFAULT 0
);

When you insert without balance:
INSERT INTO accounts (id) VALUES (1);


--COMPOSITE PRIMARY KEY
Primary key made using multiple columns together.
Example:
A student can appear for multiple exams.
But same student + same exam cannot repeat.

CREATE TABLE results (
    student_id INT,
    exam_id INT,
    marks INT,
    PRIMARY KEY (student_id, exam_id)
);

