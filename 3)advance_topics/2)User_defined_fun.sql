✅ User-Defined Function (UDF) in PostgreSQL
-> A User-Defined Function (UDF) is a custom function created by the user to perform specific logic 
and return a value.
✔ Key Points:
-> A UDF returns a value (unlike stored procedures which do not return).
-> Can be used inside:
    -> SELECT
    -> WHERE
    -> JOIN
    -> ORDER BY
-> Helps reuse common logic.
-> Supports parameters.
-> Written using plpgsql, SQL, or other languages.

🛠 Basic Syntax
CREATE FUNCTION function_name(parameters)
RETURNS return_type
LANGUAGE plpgsql
AS $$
BEGIN
    -- logic
    RETURN value;
END;
$$;

🟩 Real-Time Example: Calculate Employee Bonus
Use Case
A company gives:
10% bonus if salary > 50,000
5% bonus for all others
This logic is used in reports, dashboards, and payroll → so create a function once and reuse everywhere

🟢 User-Defined Function
CREATE FUNCTION calculate_bonus(emp_salary NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    IF emp_salary > 50000 THEN
        RETURN emp_salary * 0.10;
    ELSE
        RETURN emp_salary * 0.05;
    END IF;
END;
$$;

🟦 How to Use the Function
1️⃣ In SELECT
SELECT 
    name,
    salary,
    calculate_bonus(salary) AS bonus_amount
FROM employees;

2️⃣ In WHERE clause
SELECT *
FROM employees
WHERE calculate_bonus(salary) > 4000;

3️⃣ In UPDATE
UPDATE employees
SET bonus = calculate_bonus(salary);


🎯 Why this is a Real-Time Use Case?

Because companies repeatedly calculate:
-> salary bonus
-> incentives
-> tax
-> discount
-> commission
Instead of writing the same IF-ELSE logic in multiple queries, store it in a UDF.