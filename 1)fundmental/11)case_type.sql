✅ CASE Statement in PostgreSQL — Brief Explanation
The CASE statement allows you to perform conditional logic in SQL queries.
It is similar to IF-ELSE in programming languages.

🔹 Syntax
Simple CASE
CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ...
    ELSE result_default
END

Searched CASE
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result_default
END

Simple CASE: Compares a column/expression to values.
Searched CASE: Uses conditions (>, <, LIKE, etc.)
🔹 Real-Time Scenarios

Suppose we have an employees table:
emp_id	name	salary	department	performance_rating
    1	Ravi	60000	    IT	        A
    2	Meena	45000	    HR	        B
    3	Arun	52000	    IT	        C
    4	Divya	40000	    Finance	    B
    5	Rohit	30000	    HR	        D

1️⃣ Assign Grade Based on Salary (Searched CASE)
SELECT 
    name,
    salary,
    CASE
        WHEN salary > 50000 THEN 'High'
        WHEN salary BETWEEN 40000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_grade
FROM employees;

Output:
name	salary	salary_grade
Ravi	60000	High
Meena	45000	Medium
Arun	52000	High
Divya	40000	Medium
Rohit	30000	Low

2️⃣ Bonus Calculation Based on Performance (Searched CASE)
SELECT 
    name,
    salary,
    performance_rating,
    CASE
        WHEN performance_rating = 'A' THEN salary * 0.10
        WHEN performance_rating = 'B' THEN salary * 0.05
        ELSE salary * 0.02
    END AS bonus
FROM employees;


Output:
name	salary	performance_rating	bonus
Ravi	60000	A	6000
Meena	45000	B	2250
Arun	52000	C	1040
Divya	40000	B	2000
Rohit	30000	D	600

3️⃣ Simple CASE Example: Department Abbreviation
SELECT 
    name,
    department,
    CASE department
        WHEN 'IT' THEN 'Information Tech'
        WHEN 'HR' THEN 'Human Resource'
        WHEN 'Finance' THEN 'Finance Dept'
        ELSE 'Other'
    END AS dept_full_name
FROM employees;


Output:
name	department	dept_full_name
Ravi	IT	Information Tech
Meena	HR	Human Resource
Arun	IT	Information Tech
Divya	Finance	Finance Dept
Rohit	HR	Human Resource

4️⃣ Using CASE in ORDER BY
SELECT *
FROM employees
ORDER BY 
    CASE 
        WHEN salary > 50000 THEN 1
        WHEN salary BETWEEN 40000 AND 50000 THEN 2
        ELSE 3
    END;

This sorts High salary first, Medium second, Low last.

5️⃣ Real-Time Uses of CASE
Assign grades or categories (salary, marks, rating
Calculate bonus or discount based on conditions
Label data for reports or dashboards
Conditional aggregation: sum sales for different regions
Dynamic sorting in queries