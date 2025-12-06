⭐ 1️⃣ WHERE Clause

WHERE is used to filter rows before any grouping in a query.
It works on individual rows.

Syntax
SELECT column1, column2
FROM table_name
WHERE condition;

--✔  Examples:
1. Filter by department
SELECT * 
FROM employees
WHERE department = 'IT';


--✔  Explanation::
Returns only employees whose department is IT.

2. Filter by salary greater than 40000
SELECT name, salary 
FROM employees
WHERE salary > 40000;


--✔  Explanation::
Returns employees with salary more than 40000.

3. Filter with multiple conditions
SELECT name, salary 
FROM employees
WHERE salary > 30000 AND department = 'HR';


--✔  Explanation::
Returns employees in HR with salary > 30000.
Use AND, OR, NOT for combining conditions.

⭐ 2️⃣ HAVING Clause
HAVING is used to filter groups after aggregation.
It works only with grouped results (GROUP BY).

Syntax
SELECT column1, AGGREGATE_FUNCTION(column2)
FROM table_name
GROUP BY column1
HAVING aggregate_condition;

--✔  Examples:
--1. Count employees in each department, only if more than 1
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;


--✔  Explanation::
GROUP BY groups rows by department
HAVING filters aggregated results → only departments with >1 employee
--2. Average salary per department, only if avg > 40000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 40000;


--✔  Explanation::
Groups by department
Filters groups where average salary > 40000

⭐ WHERE vs HAVING
Feature	WHERE	HAVING
Works on	Individual rows before grouping	Groups after aggregation
Used with	Any query	Queries with GROUP BY
Cannot use	Aggregate functions (COUNT, SUM, etc.) directly	Can use aggregates directly
Example	WHERE salary > 30000	HAVING AVG(salary) > 40000

⭐ Real Example with Table
Table: employees
emp_id	name	salary	department
    1	Arun	40000	IT
    2	Meena	25000	HR
    3	Kiran	30000	IT
    4	Anita	60000	HR
    5	Ravi	55000	Finance
WHERE Example
SELECT * FROM employees WHERE salary > 30000;
Output: Arun, Anita, Ravi

GROUP BY + HAVING Example
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;


Output:
department	emp_count
    IT	        2
    HR	        2