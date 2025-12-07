✅ CTE (Common Table Expression) — Brief Explanation
What is a CTE?
A CTE is a temporary result set in SQL that you can reference within a single query.
-> It is defined using the WITH keyword.
-> Makes complex queries more readable
-> Can be recursive
-> Acts like a temporary named table

Syntax:
WITH cte_name AS (
    -- Your SELECT query here
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name
WHERE another_condition;

🔹 Real-Time Example 1: Employee Bonus Report
Suppose we have an employees table:

| emp_id | name  | salary | department | performance_rating |
| ------ | ----- | ------ | ---------- | ------------------ |
| 1      | Ravi  | 60000  | IT         | A                  |
| 2      | Meena | 45000  | HR         | B                  |
| 3      | Arun  | 52000  | IT         | C                  |
| 4      | Divya | 40000  | Finance    | B                  |
| 5      | Rohit | 30000  | HR         | D                  |

Scenario
-> Calculate bonus based on performance
-> Find total salary + bonus per department

WITH bonus_calc AS (
    SELECT 
        name,
        department,
        salary,
        CASE
            WHEN performance_rating = 'A' THEN salary * 0.10
            WHEN performance_rating = 'B' THEN salary * 0.05
            ELSE salary * 0.02
        END AS bonus
    FROM employees
)
SELECT 
    department,
    SUM(salary) AS total_salary,
    SUM(bonus) AS total_bonus,
    SUM(salary + bonus) AS total_cost
FROM bonus_calc
GROUP BY department;

Output:
| department | total_salary | total_bonus | total_cost |
| ---------- | ------------ | ----------- | ---------- |
| IT         | 112000       | 6240        | 118240     |
| HR         | 75000        | 2850        | 77850      |
| Finance    | 40000        | 2000        | 42000      |

✅ Why use CTEs in real-time?
-> Readability: Break complex queries into logical steps.
-> Reusability: Reference the temporary result multiple times in a query.
-> Recursive Queries: Useful for hierarchies (employee-manager relationships).
-> Data Analysis & Reporting: Summarize, calculate running totals, rank data.
-> ETL & Data Pipelines: Transform data step by step before final insert or reporting.

✅ Multiple CTEs — Brief Explanation
-> You can define more than one CTE by separating them with commas.
-> Each CTE can reference previous CTEs in the chain.
-> Makes complex queries modular and readable.

Syntax:
WITH 
cte1 AS (
    SELECT ... FROM ...
),
cte2 AS (
    SELECT ... FROM cte1 WHERE ...
),
cte3 AS (
    SELECT ... FROM cte2 WHERE ...
)
SELECT *
FROM cte3;

🔹 Real-Time Example: Employee Bonus & Department Summary
| emp_id | name  | salary | department | performance_rating |
| ------ | ----- | ------ | ---------- | ------------------ |
| 1      | Ravi  | 60000  | IT         | A                  |
| 2      | Meena | 45000  | HR         | B                  |
| 3      | Arun  | 52000  | IT         | C                  |
| 4      | Divya | 40000  | Finance    | B                  |
| 5      | Rohit | 30000  | HR         | D                  |


Scenario
-> Calculate bonus per employee
-> Find total compensation (salary + bonus) per employee
-> Summarize department-wise total salary, bonus, and total compensation

Query with Multiple CTEs
WITH 
bonus_calc AS (
    SELECT 
        emp_id,
        name,
        department,
        salary,
        CASE
            WHEN performance_rating = 'A' THEN salary * 0.10
            WHEN performance_rating = 'B' THEN salary * 0.05
            ELSE salary * 0.02
        END AS bonus
    FROM employees
),
compensation AS (
    SELECT 
        emp_id,
        name,
        department,
        salary,
        bonus,
        salary + bonus AS total_compensation
    FROM bonus_calc
)
SELECT 
    department,
    COUNT(emp_id) AS total_employees,
    SUM(salary) AS total_salary,
    SUM(bonus) AS total_bonus,
    SUM(total_compensation) AS total_department_cost
FROM compensation
GROUP BY department
ORDER BY total_department_cost DESC;

Output:
| department | total_employees | total_salary | total_bonus | total_department_cost |
| ---------- | --------------- | ------------ | ----------- | --------------------- |
| IT         | 2               | 112000       | 6240        | 118240                |
| HR         | 2               | 75000        | 2850        | 77850                 |
| Finance    | 1               | 40000        | 2000        | 42000                 |


✅ Why Multiple CTEs Are Useful (Real-Time)
-> Stepwise calculations: Bonus → Total compensation → Department summary
-> Readability: Each CTE handles one logical step
-> Reusability: Later CTEs can reference earlier ones
-> Reporting & Dashboards: Perfect for HR reports, sales reports, financial summaries
-> ETL Processing: Transform data in multiple stages before final load