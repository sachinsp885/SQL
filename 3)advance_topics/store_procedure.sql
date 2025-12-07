✅ Stored Procedure in PostgreSQL — Brief Explanation
What is a Stored Procedure?
A stored procedure is a saved block of SQL code that you can execute again and again.
-> It is used to perform actions such as INSERT, UPDATE, DELETE, or complex business logic.

✅ Key Points
1. Introduced in PostgreSQL 11
Stored procedures were added from PostgreSQL 11 (earlier only functions existed).

2. Can Commit & Rollback
Unlike functions, procedures can use:
-> COMMIT
-> ROLLBACK
This is useful for handling transactions inside the procedure.

3. Called using CALL
You run a stored procedure using:

CALL procedure_name(arguments);

✅ Basic Syntax
CREATE OR REPLACE PROCEDURE procedure_name(parameter_name datatype)
LANGUAGE plpgsql
AS $$
BEGIN
    -- SQL statements
END;
$$;

✅ Simple Example

A procedure to insert a record into employees:

CREATE PROCEDURE add_employee(emp_name VARCHAR, emp_age INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employees(name, age)
    VALUES (emp_name, emp_age);
END;
$$;

Run it:
CALL add_employee('Ravi', 30);

✅ When to Use Stored Procedure?

Use procedures when you need:
Complex business logic
Multiple SQL statements in one execution

Transaction control (COMMIT, ROLLBACK)
Batch operations

Here is one real-world stored procedure example in PostgreSQL — very useful in companies.
✅ Real-World Example: Monthly Salary Update Procedure
Use Case
Every month, HR wants to update employees’ salary by adding:
Bonus (10%) for high performers
5% for others

Instead of writing update queries every month manually → create a stored procedure.
🔧 Stored Procedure

CREATE PROCEDURE update_monthly_salary()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Increase salary by 10% for high performers
    UPDATE employees
    SET salary = salary + (salary * 0.10)
    WHERE performance_rating = 'A';

    -- Increase salary by 5% for others
    UPDATE employees
    SET salary = salary + (salary * 0.05)
    WHERE performance_rating <> 'A';
    COMMIT; 
END;
$$;

✔ Run the procedure
CALL update_monthly_salary();

📌 Why this is real-world?
Because companies commonly:
update salaries in bulk
calculate increments
apply bonuses
run month-end batch jobs

A stored procedure makes this automatic, consistent, and error-free.


✅ Uses of Stored Procedures in PostgreSQL
1️⃣ Reusable Business Logic
If the same SQL logic is used often (salary update, data cleanup, validations),
store it in a procedure and run anytime with CALL.

2️⃣ Transaction Control (Commit / Rollback)
-> Stored procedures allow:
   COMMIT
   ROLLBACK
Useful when:
-> multiple statements must succeed together
-> or revert together (error handling)
Example: Insert into 3 tables → fail one → rollback all.

3️⃣ Batch Processing
Used for:
-> Month-end salary updates
-> Bulk data loading
-> Batch updates/deletes
-> Scheduled jobs (cron)

4️⃣ Performance Improvement
Since the SQL is pre-compiled and stored, execution is faster.
Also reduces:
round trips between application ↔ database
repetitive query parsing

5️⃣ Security & Access Control
You can give users permission to call a procedure without giving access to tables.

Example:
User can run CALL add_employee()
but cannot manually run INSERT on the table.

6️⃣ Data Validation & Enforcing Rules
Stored procedures can validate inputs before inserting or updating.

Example:
Check salary must be > 0 before insert.
Check age must be > 18 before insert.

7️⃣ Automation
You can automate multiple steps:

Example:
Insert into main table
Insert into audit log
Update summary table

All inside one stored procedure.

8️⃣ ETL (Extract-Transform-Load) Operations
-> Very useful for Data Engineers:
-> cleaning raw data
-> transforming values
-> loading into final table
-> logging errors


| Use Case            | Why Useful              |
| ------------------- | ----------------------- |
| Reusable logic      | Avoid repeating SQL     |
| Transaction control | Safe updates            |
| Batch operations    | Automate monthly tasks  |
| Performance         | Faster execution        |
| Security            | Controlled access       |
| Validation          | Enforce business rules  |
| Automation          | Multi-step workflows    |
| ETL                 | Data pipeline inside DB |
