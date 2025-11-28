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
IT	2
HR	2

⭐ 1️⃣ ORDER BY — Sorting the Result
ORDER BY is used to sort the output of a query.

🔹 Syntax
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC|DESC];

🔹 Example
SELECT name, salary
FROM employees
ORDER BY salary DESC;


--✔  Explanation::
Sorts employees by salary high → low.

⭐ 2️⃣ GROUP BY — Group Rows + Apply Aggregation
GROUP BY is used to group rows that have the same values, usually with aggregate functions.

🔹 Syntax
SELECT column1, AGG_FUNC(column2)
FROM table_name
GROUP BY column1;

🔹 Example
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;


--✔  Explanation::
Groups employees by department, counts how many employees in each.

⭐ 3️⃣ Difference Between ORDER BY and GROUP BY
Feature	GROUP BY	ORDER BY
Purpose	Group rows	Sort rows
Works on	Raw data before final result	Final result after grouping
Uses aggregates	Yes (COUNT, SUM, AVG...)	No
Required?	Only if grouping needed	Optional
Example	GROUP BY department	ORDER BY salary DESC
⭐ 4️⃣ Using ORDER BY + GROUP BY Together

Yes, you can use both in one query.

✔ Example 1: Count employees per department and sort by count
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;


--✔  Explanation::
1️⃣ GROUP BY department → groups employees
2️⃣ COUNT(*) → count employees per department
3️⃣ ORDER BY emp_count DESC → highest count first

--✔ Example 2: Show average salary per department, sort alphabetically
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY department ASC;

--✔ Example 3: Sort by aggregated value (sum of salary)
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

⭐ 5️⃣ Complete Example with WHERE, GROUP BY, HAVING, ORDER BY
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) >= 1
ORDER BY emp_count DESC;

✔ --✔  Explanation::
WHERE salary > 30000 → filter rows BEFORE grouping
GROUP BY department → group by department
HAVING COUNT(*) >= 1 → filter groups
ORDER BY emp_count DESC → final sorted output

⭐ Final Summary
Clause	Purpose	Example
GROUP BY	Group rows	   GROUP BY department
ORDER BY	Sort output	   ORDER BY salary DESC
HAVING	    Filter groups  HAVING COUNT(*) > 1
WHERE	    Filter rows	   WHERE salary > 30000