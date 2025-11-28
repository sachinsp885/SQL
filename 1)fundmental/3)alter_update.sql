ALTER Command (DDL – Structure Change)
ALTER is used to modify the structure of a table, not the data.
You use ALTER when you want to:
->Add a column
->Drop a column
->Rename a column
->change datatype
->Add/remove constraints
->Rename table

----✔  1. Add a New Column
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

----✔  Explanation:
This adds a new column email to the table.

----✔  2. Drop (Delete) a Column
ALTER TABLE employees
DROP COLUMN email;

----✔  Explanation:
Removes the column permanently.

----✔  3. Rename a Column
ALTER TABLE employees
RENAME COLUMN name TO full_name;

----✔  4. Change Datatype of Column
ALTER TABLE employees
ALTER COLUMN salary TYPE NUMERIC(12,2);

----✔  Explanation:
Changes data type or precision.

----✔  5. Add a Constraint
Add NOT NULL:
ALTER TABLE employees
ALTER COLUMN age SET NOT NULL;

Add UNIQUE:
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

----✔  6. Drop a Constraint
ALTER TABLE employees
DROP CONSTRAINT unique_email;

------✔  7. Rename Table
ALTER TABLE employees
RENAME TO staff;

| Action            | Example           |
| ----------------- | ----------------- |
| Add column        | ADD COLUMN        |
| Remove column     | DROP COLUMN       |
| Rename column     | RENAME COLUMN     |
| Change datatype   | ALTER COLUMN TYPE |
| Add constraint    | ADD CONSTRAINT    |
| Remove constraint | DROP CONSTRAINT   |
| Rename table      | RENAME TO         |


--UPDATE Command (DML – Data Change)
UPDATE is used to modify existing data in the table.
Always use WHERE to update specific rows, otherwise all rows will update.

--✔  1. Update a Single Row
UPDATE employees
SET salary = 50000
WHERE emp_id = 3;

--✔  Explanation:

Only the row with emp_id = 3 will get salary = 50000.

--✔  2. Update Multiple Columns
UPDATE employees
SET salary = 60000,
    department = 'HR'
WHERE emp_id = 4;

--✔  Explanation:

Updates more than one column at same time.

--✔  3. Update Multiple Rows
UPDATE employees
SET department = 'IT'
WHERE department = 'Finance';

--✔  Explanation:

Changes all employees who were in Finance → now moved to IT.

--✔  4. Update All Rows (Dangerous)
UPDATE employees
SET salary = salary + 5000;

--✔  Explanation:

Increases salary for every employee.
No WHERE → affects whole table.

--✔  5. Update Using Calculation
UPDATE employees
SET salary = salary * 1.10;

--✔  Explanation:

Gives 10% hike to all employees.

--✔  6. Update Using Subquery
UPDATE employees
SET department = (
    SELECT dept_name FROM department WHERE dept_id = 2
)
WHERE emp_id = 5;


| ALTER                       | UPDATE                 |
| --------------------------- | ---------------------- |
| Changes table **structure** | Changes table **data** |
| Example: add column         | Example: change salary |
| DDL command                 | DML command            |
| Affects schema              | Affects rows           |
