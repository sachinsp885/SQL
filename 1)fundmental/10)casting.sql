✅ Casting in PostgreSQL — Brief Explanation
What is Casting?

Casting means converting one data type into another data type.

Example:

text → integer

integer → text

text → date

numeric → float

In PostgreSQL, casting is done using:

CAST(value AS datatype)

value::datatype (shortcut operator)

🟦 Why Casting is Needed? (Real-Time Uses)
✔ 1. When data is stored as text but you need numeric operations

Example: salary saved as '45000' (text) → convert to integer to add, sort, compare.

✔ 2. Convert string dates into real DATE type

Example: '2024-05-01' → DATE for filtering and calculations.

✔ 3. While joining tables with mismatched data types

Example: one column is TEXT and another is INT → cast to match.

✔ 4. Converting NULL/empty values into clean type-safe values

Useful in ETL pipelines and data engineering.

🟩 Real-Time Example 1: Convert text salary to integer to add bonus

Suppose salary column is stored as text:

name	salary_text
Ravi	'40000'
Meena	'50000'
➤ Query:
SELECT 
    name,
    salary_text::INT + 5000 AS updated_salary
FROM employees;

✔ What happens?

'40000' (text) → 40000 (int)
Then 5000 added → 45000

🟩 Real-Time Example 2: Converting text date into proper DATE format

Table:

emp_name	joining_date
Arun	'2024-01-10'
Divya	'2024-03-25'

(joining_date stored as TEXT)

➤ Query:
SELECT 
    emp_name,
    CAST(joining_date AS DATE) AS joining_dt
FROM employees;

✔ Why?

To apply date filters:

SELECT emp_name 
FROM employees
WHERE CAST(joining_date AS DATE) > '2024-02-01';

🟩 Real-Time Example 3: Joining text ID with integer ID
table_1.emp_id = INTEGER  
table_2.emp_id = TEXT

➤ Query:
SELECT *
FROM table_1 t1
JOIN table_2 t2
ON t1.emp_id = t2.emp_id::INT;

✔ Why?

Without casting → join fails with datatype mismatch.

🟦 Casting Syntax Quick Reference

✔ Method 1:

CAST(value AS datatype)


✔ Method 2 (most used):

value::datatype